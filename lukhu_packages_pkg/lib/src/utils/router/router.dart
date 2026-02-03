import 'package:flutter/material.dart';

import '../../../lukhu_packages_pkg.dart'
    show
        AuthGenesisPage,
        GoRoute,
        GoRouterState,
        ReadContext,
        StringExtension,
        UserRepository;

class RouterUtils {
  static GoRoute generateGoRoute(
      {required String routeName,
      required String routePath,
      Widget Function(BuildContext, GoRouterState)? builder,
      bool guarded = false}) {
    return GoRoute(
        redirect: (context, state) {
          if(!guarded) return null;
          if (context.read<UserRepository>().userAuthenticated) {
            return null;
          }  
          return AuthGenesisPage.routeName.toRouterPath();
        },
        name: routeName,
        path: routePath.toRouterPath(),
        builder: builder);
  }
}
