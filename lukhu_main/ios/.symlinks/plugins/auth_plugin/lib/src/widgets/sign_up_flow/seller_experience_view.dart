import 'package:auth_plugin/src/controllers/auth/sign_up_flow.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show SellerExperienceCard, StepSubTitle, StepTitle;

import '../../const/auth_constants.dart';
import '../buttons/default_auth_btn.dart';

class SellerExperienceView extends StatelessWidget {
  const SellerExperienceView({super.key, required this.signUpFlowController});
  final SignUpFlowController signUpFlowController;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StepTitle(title: 'How do you sell?'),
        const StepSubTitle(
            subTitle:
                'Tell us about your selling experience and we’ll get your online store ready in a few'),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _experienceOptions.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: size.height * .15,
                childAspectRatio: .9,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            itemBuilder: (_, i) => SellerExperienceCard(
                assetImage: 'assets/icons/${_experienceOptions[i]['image']!}',
                title: _experienceOptions[i]['title']!,
                selected: signUpFlowController.sellerExperience ==
                    _experienceOptions[i]['title']!,
                onTap: () {
                  signUpFlowController.sellerExperience =
                      _experienceOptions[i]['title']!;
                }),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        AuthButton(
          color: AuthConstants.buttonBlue,
          label: 'Next',
          actionDissabledColor: AuthConstants.buttonBlueDissabled,
          onTap: signUpFlowController.sellerExperience.isEmpty
              ? null
              : () {
                  // Go to next option
                  signUpFlowController.currentOption++;
                  // NavigationService.navigate(
                  //   context,
                  //   CategorySelectionView.routeName,
                  //   arguments: {
                  //     "type": AppType.dukastax,
                  //   },
                  // );
                },
        ),
        const SizedBox(
          height: 25,
        ),
        AuthButton(
          color: Colors.white,
          label: 'Skip for now',
          actionDissabledColor: AuthConstants.buttonBlueDissabled,
          textColor: const Color(0xff34303E),
          boarderColor: AuthConstants.boarderColor,
          onTap: () {
            //Skip current option
            signUpFlowController.currentOption++;
          },
        ),
      ],
    );
  }

  List<Map<String, String>> get _experienceOptions => [
        {
          'title': 'I just started selling',
          'image': 'shop_add',
          "duka_image": "assets/icons/shop-add",
        },
        {
          'title': 'I sell offline only',
          'image': 'sell_offline',
          "duka_image": "assets/icons/building",
        },
        {
          'title': 'I sell online already',
          'image': 'sell_online',
          "duka_image": "assets/icons/global",
        },
        {
          'title': 'I sell online and offline',
          'image': 'online_offline',
          "duka_image": "assets/icons/map",
        },
        {
          'title': 'I’m opening a shop for someone else',
          'image': 'user_add',
          "duka_image": "assets/icons/user-add",
        },
        {
          'title': 'I’m just looking around',
          'image': 'eye',
          "duka_image": "assets/icons/eye",
        },
      ];
}
