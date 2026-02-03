import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:auth_plugin/src/controllers/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show ReadContext;
class RevelationView extends StatelessWidget {
  const RevelationView({super.key});
  static const routeName = 'revelation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AuthConstants.optionCardBackgroundBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome !!!',style: TextStyle(
              color: AuthConstants.textDarkColor,
              fontSize: 35,
              fontWeight: FontWeight.w800
            ),),
             TextButton(onPressed:() => context.read<UserRepository>().signOut(), child: const Text('LogOut'))
          ],
        ),
      ),
    );
  }
}