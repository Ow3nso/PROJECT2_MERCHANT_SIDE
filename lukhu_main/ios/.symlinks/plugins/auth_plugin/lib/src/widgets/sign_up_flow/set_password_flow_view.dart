// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:auth_plugin/src/controllers/auth/sign_up_flow.dart';
import 'package:auth_plugin/src/widgets/inputs/auth_input_field.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/user_account_type.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show ReadContext, ShortMessageType, ShortMessages, SvgPicture, WatchContext;

import '../../const/auth_constants.dart';
import '../../controllers/user/user_repository.dart';
import '../../pages/login.dart';
import '../../services/field_validators.dart';
import '../buttons/default_auth_btn.dart';

class SetPasswordFlowView extends StatefulWidget {
  const SetPasswordFlowView({super.key, required this.signUpFlowController});
  final SignUpFlowController signUpFlowController;

  @override
  State<SetPasswordFlowView> createState() => _SetPasswordFlowViewState();
}

class _SetPasswordFlowViewState extends State<SetPasswordFlowView> {
  bool obscurePassword = true;
  bool passwordHasError = false;
  final _formKey = GlobalKey<FormState>();
  Future<void> _signUp() async {
    if (context.read<UserRepository>().fbUser != null) {
      _navigatedAfterSignup();
      return;
    }
    bool signedUp = await context.read<UserRepository>().signup(
        widget.signUpFlowController.name.trim(),
        widget.signUpFlowController.emailController.text.trim(),
        widget.signUpFlowController.passwordController.text.trim());
    if (signedUp) {
      _navigatedAfterSignup();
      return;
    }
    ShortMessages.showShortMessage(
      message: context.read<UserRepository>().error ??
          'We are facing some technical challenges please try again',
      type: ShortMessageType.error,
    );
  }

  /// The function increments the currentOption variable in the signUpFlowController object.
  void _navigatedAfterSignup() {
    widget.signUpFlowController.currentOption++;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StepTitle(title: 'Choose your password'),
          const StepSubTitle(
              subTitle:
                  'Your password must have at least 8 characters,one upper case,one lower case,one digit and a special character (?=.*?[!@#\$&*~])'),
          Form(
            key: _formKey,
            child: AuthInputField(
              label: 'Password',
              hintText: 'Strong Password',
              obscureText: obscurePassword,
              controller: widget.signUpFlowController.passwordController,
              validator: (s) {
                final error = FieldsValidator.passwordVlidator(s);
                setState(() {
                  passwordHasError = error != null;
                });
                return error;
              },
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
                child: obscurePassword
                    ? passwordHasError
                        ? const SuffixErrorIcon()
                        : Icon(
                            Icons.visibility_off_rounded,
                            color: AuthConstants.suffixGray,
                          )
                    : Icon(Icons.visibility_rounded,
                        color: AuthConstants.suffixGray),
              ),
              onChange: (s) {
                setState(() {});
              },
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          ...List.generate(
              _passwordRules.length,
              (i) => PasswordStrengthCard(
                    label: _passwordRules[i]['label'],
                    has: _passwordRules[i]['has'],
                  )),
          SizedBox(
            height: size.height * .03,
          ),
          AuthButton(
            loading:
                context.watch<UserRepository>().status == Status.authenticating,
            color: AuthConstants.buttonBlue,
            label: 'Continue',
            actionDissabledColor: AuthConstants.buttonBlueDissabled,
            onTap: widget.signUpFlowController.passwordController.text.isEmpty
                ? null
                : () {
                    // Go to next option
                    if (!_formKey.currentState!.validate()) return;
                    _signUp();
                  },
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> get _passwordRules =>
      FieldsValidator.passwordRules(
          widget.signUpFlowController.passwordController.text);
}

class PasswordStrengthCard extends StatelessWidget {
  const PasswordStrengthCard(
      {super.key, required this.label, this.has = false});
  final String label;
  final bool has;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/svg/tick_square.svg',
          package: AuthConstants.pluginName,
          color: has ? Colors.green : Colors.red,
          height: 12,
          width: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            label,
            style: TextStyle(
                color: has ? Colors.green : Colors.red,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
