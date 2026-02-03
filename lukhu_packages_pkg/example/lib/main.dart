import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        DeviceInfoPlugin,
        Firebase,
        GoogleFonts,
        LuhkuRoutes,
        MultiProvider,
        NavigationController,
        NavigationControllers,
        NavigationService,
        ReadContext;
// ignore: depend_on_referenced_packages


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
  };

  Map<String, Widget Function(BuildContext)> openAppRoutes = {
    ...LuhkuRoutes.public,
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
  const MyApp({super.key, this.useMaterial3 = false});
  final bool useMaterial3;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luhku PKGs',
      routes: {...context.read<NavigationController>().availableRoutes},
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: useMaterial3,
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      initialRoute: '/',
      onGenerateRoute: NavigationControllers.materialpageRoute,
      navigatorKey: NavigationService.navigatorKey,
    );
  }
}
