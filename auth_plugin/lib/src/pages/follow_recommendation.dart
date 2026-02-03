import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:auth_plugin/src/controllers/auth/sign_up_flow.dart';
import 'package:auth_plugin/src/pages/progress_screen.dart';
import 'package:auth_plugin/src/widgets/cards/shop_account_card.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/user_account_type.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show NavigationService, ReadContext, WatchContext;

import '../widgets/buttons/default_auth_btn.dart';

class FollowerRecommendetionPage extends StatelessWidget {
  const FollowerRecommendetionPage({
    super.key,
  });
  static const routeName = 'follow_recommendation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AuthConstants.optionCardBackgroundBlue,
      body: SafeArea(
          child: AnimatedBuilder(
        animation: context.read<SignUpFlowController>(),
        builder: (_, c) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StepTitle(title: 'Our recommendations'),
                const StepSubTitle(
                    subTitle:
                        'Here are some recommended stores to follow based on your categories and sizes'),
                if(context.watch<SignUpFlowController>().loading)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                ),
                if(!context.watch<SignUpFlowController>().loading && context.watch<SignUpFlowController>().trendingSellers.isEmpty )
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text('There are no suggested sellers for you at this time\n You\'ll get more after the setup is complete',textAlign: TextAlign.center,style: TextStyle(
                      color: AuthConstants.textDarkColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                     ),),
                   ),
                ...List.generate(
                    context.watch<SignUpFlowController>().trendingSellers.length,
                    (i) => ShopAccountCard(
                          following: context
                              .read<SignUpFlowController>()
                              .followingHandles
                              .contains(context
                                  .read<SignUpFlowController>()
                                  .trendingSellers[i]['id']!),
                          data: context
                              .read<SignUpFlowController>()
                              .trendingSellers[i],
                          onTap: () {
                            context
                                .read<SignUpFlowController>()
                                .updateFollowinghadle(context
                                    .read<SignUpFlowController>()
                                    .trendingSellers[i]['id']!);
                          },
                        ))
              ],
            ),
          ),
        ),
      )),
      bottomNavigationBar: Container(
        height: 110,
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            child: AuthButton(
              color: AuthConstants.buttonBlue,
              label: 'Continue',
              actionDissabledColor: AuthConstants.buttonBlueDissabled,
              onTap: () {
                // Go to next option
                context.read<SignUpFlowController>().mockProgress();
                NavigationService.navigate(
                    context, ProgressScreen.routeName);
              },
            ),
          ),
        ),
      ),
    );
  }
}
