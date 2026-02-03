// ignore_for_file: use_build_context_synchronously

import 'package:auth_plugin/src/controllers/auth/sign_up_flow.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/user_account_type.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultInputField, ReadContext, UserFields, WatchContext;
import '../../const/auth_constants.dart';
import '../../controllers/user/user_repository.dart';
import '../../pages/login.dart';
import '../../services/auth/user_data_check.dart';
import '../../services/field_validators.dart';
import '../buttons/default_auth_btn.dart';

class NameFlowView extends StatefulWidget {
  const NameFlowView({super.key, required this.signUpFlowController});
  final SignUpFlowController signUpFlowController;

  @override
  State<NameFlowView> createState() => _NameFlowViewState();
}

class _NameFlowViewState extends State<NameFlowView> {
  bool emailHasError = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ListView(
      //  crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StepTitle(title: 'What’s your name?'),
        const StepSubTitle(
            subTitle: 'This will help us personalize Lukhu for you'),
        Form(
            key: _formKey,
            child: Column(
              children: [
                DefaultInputField(
                  textInputAction: TextInputAction.next,
                  onChange: (s) {
                    setState(() {});
                  },
                  controller: widget.signUpFlowController.nameController,
                  keyboardType: TextInputType.name,
                  label: 'Name',
                  hintText: 'John Doe',
                ),
                const SizedBox(
                  height: 15,
                ),
                DefaultInputField(
                  textInputAction: TextInputAction.done,
                  suffixIcon: emailHasError ? const SuffixErrorIcon() : null,
                  onChange: (s) {
                    setState(() {});
                  },
                  validator: (s) {
                    final error = FieldsValidator.emailValidator(s);
                    setState(() {
                      emailHasError = error != null;
                    });
                    return error;
                  },
                  controller: widget.signUpFlowController.emailController,
                  keyboardType: TextInputType.emailAddress,
                  label: 'Email',
                  hintText: 'johndoe@gmail.com',
                ),
              ],
            )),
        const SizedBox(
          height: 55,
        ),
        AuthButton(
          loading: context.watch<UserRepository>().status == Status.loading,
          color: AuthConstants.buttonBlue,
          label: 'Continue',
          actionDissabledColor: AuthConstants.buttonBlueDissabled,
          onTap: widget.signUpFlowController.nameController.text.isEmpty ||
                  widget.signUpFlowController.emailController.text.isEmpty
              ? null
              : () async {
                  // Go to next option
                  if (_formKey.currentState!.validate()) {
                    context.read<UserRepository>().status = Status.loading;
                    bool taken = await UserDataCheck.isValueTaken(
                        widget.signUpFlowController.emailController.text,
                        UserFields.email);
                    context.read<UserRepository>().status =
                        Status.unauthenticated;
                    if (taken) {
                      setState(() {
                        emailHasError = true;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'The Provided email is taken, try another!!!')));
                      return;
                    }
                    widget.signUpFlowController.currentOption++;
                  }
                },
        ),
      ],
    );
  }
}
