import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
    ColorSchemeHarmonization,
    DynamicColorBuilder,
    Firebase,
    GoogleFonts,
    LuhkuRoutes,
    MultiProvider,
    NavigationController,
    NavigationControllers,
    NavigationService,
    ReadContext,
    darkColorScheme,
    darkCustomColors,
    lightColorScheme,
    lightCustomColors;

import 'package:sales_pkg/src/controllers/auth_controller.dart';
import 'package:lukhu_main/firebase/firebase_options_dev.dart%20-%20android_service%20android/app/src/dev/google-services.json%20-iso_service%20ios/config/dev/firebase_app_id_file_dev.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔐 Firebase Init
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    debugPrint('✅ Firebase initialized (${kIsWeb ? "Web" : "Mobile"})');
  } catch (e, s) {
    debugPrint('❌ Firebase init failed: $e');
    debugPrintStack(stackTrace: s);
  }

  Get.put(AuthController()); // Init AuthController

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Define all routes (public + guarded)
    final Map<String, Widget Function(BuildContext)> allRoutes = {
      ...LuhkuRoutes.public,
      ...LuhkuRoutes.guarded,
    };

    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        final ColorScheme lightScheme =
            lightDynamic?.harmonized() ?? lightColorScheme;
        final ColorScheme darkScheme =
            darkDynamic?.harmonized() ?? darkColorScheme;

        lightCustomColors = lightCustomColors.harmonized(lightScheme);
        darkCustomColors = darkCustomColors.harmonized(darkScheme);

        return MultiProvider(
          providers: [
            ...NavigationControllers.providers(
              guardedAppRoutes: LuhkuRoutes.guarded,
              openAppRoutes: LuhkuRoutes.public,
            ),
          ],
          child: GetMaterialApp(
            title: 'Luhku',
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationService.navigatorKey,
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: lightScheme,
              extensions: [lightCustomColors],
              fontFamily: GoogleFonts.inter().fontFamily,
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: darkScheme,
              extensions: [darkCustomColors],
              fontFamily: GoogleFonts.inter().fontFamily,
            ),

            // ✅ Use a home widget to handle auth flow
            home: const AuthBootstrap(),

            // Required for NavigationControllers
            onGenerateRoute: NavigationControllers.materialpageRoute,
            routes: allRoutes,
          ),
        );
      },
    );
  }
}

/// 🔹 Determines initial page based on Auth
class AuthBootstrap extends StatelessWidget {
  const AuthBootstrap({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // 🔄 Waiting for auth
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        }

        // 🔐 User not logged in
        if (!snapshot.hasData || snapshot.data == null) {
          return const LoginScreen(); // replace with your login page
        }

        // ✅ User logged in
        final appType = String.fromEnvironment('APP_TYPE', defaultValue: 'dukastax');
        final initialRoute = (appType == 'dukastax') ? '/' : '/service';

        // Navigate after first frame
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (NavigationService.navigatorKey.currentState != null) {
            NavigationService.navigatorKey.currentState!.pushReplacementNamed(initialRoute);
          }
        });

        return const SplashScreen();
      },
    );
  }
}

/// Simple splash screen
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

/// Example login screen placeholder
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Example login flow
            await FirebaseAuth.instance.signInAnonymously();
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
