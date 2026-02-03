import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/account_type_card.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart';

import '../buttons/default_auth_btn.dart';

class SelectAccountTypeView extends StatelessWidget {
  const SelectAccountTypeView({super.key, required this.signUpFlowController});
  final SignUpFlowController signUpFlowController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StepTitle(
          title: 'Tell us about yourself',
        ),
        const StepSubTitle(
          subTitle:
              'Tell us a bit about yourself so that we can create the best Lukhu experience for you.',
        ),
        ...List.generate(
            _options.length,
            (i) => AccountTypeCard(
                selected: _selectedOption(i),
                onTap: () {
                  if (_selectedOption(i)) {
                    signUpFlowController.accountTypeSelectedOption = null;
                    return;
                  }
                  signUpFlowController.accountTypeSelectedOption =
                      _options[i]['label'];
                },
                iconAsset: 'assets/icons/${_options[i]['icon']!}',
                label: _options[i]['label']!)),
        const SizedBox(
          height: 55,
        ),
        AuthButton(
          color: AuthConstants.buttonBlue,
          label: 'Next',
          actionDissabledColor: AuthConstants.buttonBlueDissabled,
          onTap: signUpFlowController.accountTypeSelectedOption == null
              ? null
              : () {
                  // Go to next option
                  signUpFlowController.currentOption++;
                },
        ),
        const SizedBox(
          height: 25,
        ),
        if (context.watch<SignUpFlowController>().isMarketplace)
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

  bool _selectedOption(int i) =>
      signUpFlowController.accountTypeSelectedOption == _options[i]['label'];

  List<Map<String, String>> get _options => [
        {'icon': 'shopping_bag', 'label': 'I want to Buy'},
        {'icon': 'shop_add', 'label': 'I want to Sell'},
        {'icon': 'medal_star', 'label': 'Maybe both'},
      ];
}

class StepSubTitle extends StatelessWidget {
  const StepSubTitle({Key? key, required this.subTitle}) : super(key: key);
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 40),
      child: Text(
        subTitle,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
    );
  }
}

class StepTitle extends StatelessWidget {
  const StepTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Inter',
        letterSpacing: 0.24,
        color: AuthConstants.textDarkColor,
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
