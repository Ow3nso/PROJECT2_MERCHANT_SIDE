import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        ColorSchemeHarmonization,
        DeviceInfoPlugin,
        DukastaxRoutes,
        DynamicColorBuilder,
        Firebase,
        GoogleFonts,
        LuhkuRoutes,
        MultiProvider,
        NavigationController,
        NavigationControllers,
        ReadContext,
        darkColorScheme,
        darkCustomColors,
        lightColorScheme,
        lightCustomColors;
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  final androidInfo = await DeviceInfoPlugin().androidInfo;
  final sdkVersion = androidInfo.version.sdkInt;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Map<String, Widget Function(BuildContext)> guardedAppRoutes = {
    ...LuhkuRoutes.guarded,
    ...DukastaxRoutes.guarded,
  };

  Map<String, Widget Function(BuildContext)> openAppRoutes = {
    ...LuhkuRoutes.public,
    ...DukastaxRoutes.public,
  };

  runApp(
    MultiProvider(
      providers: [
        ...NavigationControllers.providers(
            guardedAppRoutes: guardedAppRoutes, openAppRoutes: openAppRoutes),
      ],
      child: MyApp(
        useMaterial3: sdkVersion > 30,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    this.useMaterial3 = false,
  });
  final bool useMaterial3;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      ColorScheme lightScheme;
      ColorScheme darkScheme;

      if (lightDynamic != null && darkDynamic != null) {
        lightScheme = lightDynamic.harmonized();
        lightCustomColors = lightCustomColors.harmonized(lightScheme);

        // Repeat for the dark color scheme.
        darkScheme = darkDynamic.harmonized();
        darkCustomColors = darkCustomColors.harmonized(darkScheme);
      } else {
        // Otherwise, use fallback schemes.
        lightScheme = lightColorScheme;
        darkScheme = darkColorScheme;
      }
      return MaterialApp(
        title: 'Luhku auth',
        routes: {...context.read<NavigationController>().availableRoutes},
        theme: ThemeData(
          // primarySwatch: Colors.blue,
          useMaterial3: true,
          colorScheme: lightScheme,
          extensions: [lightCustomColors],
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
        initialRoute: DukastaxRoutes.initialRoute,
        onGenerateRoute: NavigationControllers.materialpageRoute,
      );
    });
  }
}
