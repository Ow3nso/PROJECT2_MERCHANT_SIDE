import 'package:auth_plugin/auth_plugin.dart';
import 'package:auth_plugin/src/controllers/auth/edit_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show CustomColors, DefaultButton, ReadContext, StyleColors, WatchContext;

import '../../utils/app_util.dart';

class UpdatePassword extends StatelessWidget {
  const UpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = context.watch<EditAccountController>();
    return AnimatedPadding(
      duration: AppUtil.animationDuration,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: size.width,
        height: 400,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(color: StyleColors.lukhuDividerColor),
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(8)),
        child: Form(
          key: context.read<EditAccountController>().updatePasswordFormKey,
          child: ListView(
            children: [
              Text('Update your password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.scrim,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 0),
                child:
                    Text('Pick a strong password to secure your Lukhu account.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: StyleColors.lukhuGrey80,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: AuthInputField(
                  controller: controller.originalPasswordController,
                  onChange: (value) {},
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.showOriginalPassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Cannot be empty';
                    }
                    return null;
                  },
                  hintText: 'Original Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.showOriginalPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      context
                          .read<EditAccountController>()
                          .updateOriginalPassword();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: AuthInputField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.showNewPassword,
                  controller: controller.newPasswordController,
                  onChange: (value) {},
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Cannot be empty';
                    }
                    return null;
                  },
                  hintText: 'New Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.showNewPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      context.read<EditAccountController>().updateNewPassword();
                    },
                  ),
                ),
              ),
              AuthInputField(
                keyboardType: TextInputType.visiblePassword,
                controller: controller.repeatPasswordController,
                obscureText: controller.showRepeatPassword,
                onChange: (value) {},
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Cannot be empty';
                  }
                  return null;
                },
                hintText: 'Repeat New Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.showRepeatPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    context
                        .read<EditAccountController>()
                        .updateRepeatPassword();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 16),
                child: DefaultButton(
                  label: 'Save',
                  onTap: () {},
                  width: size.width - 32,
                  height: 40,
                  color: Theme.of(context).extension<CustomColors>()?.neutral,
                ),
              ),
              DefaultButton(
                label: 'Cancel',
                onTap: () {
                  Navigator.of(context).pop(true);
                },
                width: size.width - 32,
                height: 40,
                textColor: Theme.of(context).colorScheme.scrim,
                boarderColor: StyleColors.lukhuDividerColor,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
