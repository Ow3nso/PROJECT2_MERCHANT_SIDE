import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        ColorSchemeHarmonization,
        DeviceInfoPlugin,
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
// ignore: depend_on_referenced_packages
import 'package:product_listing_pkg/product_listing_pkg.dart'
    show  ListingRoutes;

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
    ...ListingRoutes.guarded,
  };

  Map<String, Widget Function(BuildContext)> openAppRoutes = {
    ...LuhkuRoutes.public,
    ...ListingRoutes.public,
  };
  runApp(
    MultiProvider(
      providers: [
        ...NavigationControllers.providers(
            guardedAppRoutes: guardedAppRoutes, openAppRoutes: openAppRoutes),
        ...ListingRoutes.listingProviders()
      ],
      child:  MyApp(
        useMaterial3: sdkVersion > 30,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,this.useMaterial3 = false});
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
        title: 'Luhku Products',
        routes: {...context.read<NavigationController>().availableRoutes},
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: useMaterial3,
          colorScheme: lightScheme,
          extensions: [lightCustomColors],
          fontFamily: GoogleFonts.inter().fontFamily,

        ),
        initialRoute: '/',
        onGenerateRoute: NavigationControllers.materialpageRoute,
        navigatorKey: NavigationService.navigatorKey,
          
      );
    }
    );
  }
}
