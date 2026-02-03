// ignore_for_file: use_build_context_synchronously

import 'package:auth_plugin/auth_plugin.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show ReadContext, UserFields, WatchContext;
import '../../const/auth_constants.dart';
import '../../services/auth/user_data_check.dart';
import '../buttons/default_auth_btn.dart';

class UserNameFlowView extends StatefulWidget {
  const UserNameFlowView({super.key, required this.signUpFlowController});
  final SignUpFlowController signUpFlowController;

  @override
  State<UserNameFlowView> createState() => _UserNameFlowViewState();
}

class _UserNameFlowViewState extends State<UserNameFlowView> {
  bool _usernameHasError = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        StepTitle(
            title: widget.signUpFlowController.userIsASeller
                ? 'Pick a store link...'
                : 'Pick a username...'),
        StepSubTitle(
            subTitle: widget.signUpFlowController.userIsASeller
                ? "This link will be your store’s website link that you can share with your customers."
                : 'A username improves how you interact with other users on Lukhu'),
        AuthInputField(
          textInputAction: TextInputAction.done,
          suffix: const SizedBox(
            width: 105,
            height: 20,
            child: Row(
              children: [
                Expanded(child: VerticalDivider()),
                Text('.lukhu.shop')
              ],
            ),
          ),
          onChange: (s) {
            context.read<UserRepository>().userName = s;
            setState(() {});
          },
          suffixIcon: _usernameHasError ? const SuffixErrorIcon() : null,
          label: 'Username',
          helperText: 'Hint: Try your Instagram username!',
          controller: widget.signUpFlowController.usernameController,
        ),
        const SizedBox(
          height: 55,
        ),
        AuthButton(
          loading: context.watch<UserRepository>().status == Status.loading,
          color: AuthConstants.buttonBlue,
          label: 'Continue',
          actionDissabledColor: AuthConstants.buttonBlueDissabled,
          onTap: widget.signUpFlowController.usernameController.text.isEmpty
              ? null
              : () async {
                  // Go to next option
                  context.read<UserRepository>().status = Status.loading;
                  bool taken = await UserDataCheck.isValueTaken(
                      widget.signUpFlowController.usernameController.text
                          .trim()
                          .toLowerCase(),
                      UserFields.userName);
                  context.read<UserRepository>().status =
                      Status.unauthenticated;
                  if (taken) {
                    setState(() {
                      _usernameHasError = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'The Provided username is taken, try another!!!')));
                    return;
                  } else {
                    _usernameHasError = false;
                  }
                  widget.signUpFlowController.currentOption++;
                },
        ),
      ],
    );
  }
}
