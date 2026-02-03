import 'package:auth_plugin/src/controllers/auth/edit_account_controller.dart';
import 'package:auth_plugin/src/utils/app_util.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        CustomColors,
        DefaultButton,
        DefaultInputField,
        Helpers,
        ReadContext,
        ShortMessages,
        StyleColors,
        UserRepository,
        WatchContext;

class UpdateProfile extends StatelessWidget {
  UpdateProfile({super.key, this.index = 0, this.onTap});
  final int index;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (index) {
      case 0:
        child = DefaultInputField(
          controller:
              context.watch<EditAccountController>().firstNameController,
          onChange: (value) {},
          keyboardType: TextInputType.name,
        );
        break;
      case 1:
        child = DefaultInputField(
          controller: context.watch<EditAccountController>().lastNameController,
          onChange: (value) {},
          keyboardType: TextInputType.name,
        );
        break;
      case 2:
        child = DefaultInputField(
          controller:
              context.watch<EditAccountController>().phoneNumberController,
          onChange: (value) {},
          keyboardType: TextInputType.phone,
        );
        break;

      default:
        child = DefaultInputField(
          controller:
              context.watch<EditAccountController>().firstNameController,
          onChange: (value) {},
          keyboardType: TextInputType.name,
        );
    }

    return AnimatedPadding(
      duration: AppUtil.animationDuration,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 263,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          border: Border.all(
            color: StyleColors.lukhuDividerColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              details[index]!['title'],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.scrim,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, top: 8),
              child: Text(
                details[index]!['description'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: StyleColors.greyWeak1,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
            child,
            Padding(
              padding: const EdgeInsets.only(bottom: 8, top: 8),
              child: DefaultButton(
                label: 'Save',
                onTap: () {
                  Helpers.debugLog('[DEBUG] EDIT');
                  _update(context);
                },
                loading: context.watch<EditAccountController>().isLoading,
                width: MediaQuery.sizeOf(context).width - 32,
                height: 40,
                color: Theme.of(context).extension<CustomColors>()?.neutral,
              ),
            ),
            DefaultButton(
              label: 'Cancel',
              onTap: () {
                Navigator.of(context).pop(true);
              },
              width: MediaQuery.sizeOf(context).width - 32,
              height: 40,
              textColor: Theme.of(context).colorScheme.scrim,
              boarderColor: StyleColors.lukhuDividerColor,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }

  void _update(BuildContext context) {
    if (context.read<EditAccountController>().allowEditing) {
      Helpers.debugLog('[DEBUG] Start');

      context.read<EditAccountController>().updateProfileData().then((value) {
        if (value) {
          context.read<EditAccountController>().isLoading = true;
          context
              .read<UserRepository>()
              .updateUser(context.read<EditAccountController>().user!)
              .then((value) {
            context.read<EditAccountController>().isLoading = false;
            if (value) {
              context.read<UserRepository>().fsUser =
                  context.read<EditAccountController>().user;
              context
                  .read<EditAccountController>()
                  .init(context.read<EditAccountController>().user!);

              Navigator.of(context).pop(true);
              ShortMessages.showShortMessage(message: 'Successfully updated!.');
            } else {
              ShortMessages.showShortMessage(
                message: 'Semething happened. Please try again!.',
              );
            }
          }).whenComplete(() {
            context.read<EditAccountController>().isLoading = false;
          });
        } else {
          ShortMessages.showShortMessage(
            message: 'User data hasn\'t changed. Please try ',
          );
        }
      });
    } else {
      Helpers.debugLog('[DEBUG] NOT ALLOWED');
    }
  }

  final Map<int, Map<String, dynamic>> details = {
    0: {
      'title': 'Update your first name',
      'description':
          'Your name enables us to personalise Lukhu and give you an exceptional experience,'
    },
    1: {
      'title': 'Update your last name',
      'description':
          'Your name enables us to personalise Lukhu and give you an exceptional experience,'
    },
    2: {
      'title': 'Update your phone number',
      'description':
          'Your phone number enables the Lukhu team to reach you with ease. We will not share this information with external parties.'
    },
  };
}
