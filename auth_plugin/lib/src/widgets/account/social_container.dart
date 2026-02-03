import 'package:auth_plugin/auth_plugin.dart';
import 'package:auth_plugin/src/controllers/auth/edit_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        DefaultTextBtn,
        HourGlass,
        ReadContext,
        StyleColors,
        WatchContext,
        Helpers;

import '../../utils/app_util.dart';
import 'edit_social.dart';

class SocialContainer extends StatelessWidget {
  const SocialContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: StyleColors.lukhuWhite,
        border: Border.all(
          color: StyleColors.lukhuDividerColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              context.read<EditAccountController>().isEditing =
                  !context.read<EditAccountController>().isEditing;
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: StyleColors.lukhuDividerColor,
              ))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Image.asset(
                      AppUtil.gloablSearchIcon,
                      package: AppUtil.packageName,
                    ),
                  ),
                  Text(
                    'Social Media Details',
                    style: TextStyle(
                      color: StyleColors.lukhuDark1,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  DefaultTextBtn(
                    label: context.watch<EditAccountController>().isEditing
                        ? "Save"
                        : "Edit",
                    onTap: () {
                      _update(context);
                    },
                    underline: false,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 10),
            child: context.read<EditAccountController>().isLoading
                ? const Center(
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: HourGlass(),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: context
                        .watch<EditAccountController>()
                        .socialMedia
                        .length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = context
                          .watch<EditAccountController>()
                          .socialMedia[index];
                      return AnimatedCrossFade(
                        firstChild: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: StyleColors.lukhuWhite,
                              border: Border.all(
                                color: StyleColors.lukhuDividerColor,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Image.asset(
                                    item['image'],
                                    package: AppUtil.packageName,
                                  ),
                                ),
                                Text(
                                  item['value'],
                                  style: TextStyle(
                                    color: StyleColors.greyWeak1,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        secondChild: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: EditSocial(
                            index: index,
                            image: item['image'],
                            color: item['color'],
                          ),
                        ),
                        crossFadeState:
                            context.watch<EditAccountController>().isEditing
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                        duration: AppUtil.animationDuration,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _update(BuildContext context) {
    context.read<EditAccountController>().isEditing = true;
    if (context.read<EditAccountController>().userIsReady) {
      context.read<EditAccountController>().isLoading = true;
      context.read<EditAccountController>().userIsReady = false;
      context
          .read<UserRepository>()
          .updateShop(
            context.read<UserRepository>().shop!,
          )
          
          .then((value) {
        context.read<EditAccountController>().isLoading = false;
        if (value) {
          context.read<EditAccountController>().isEditing = false;
          context.read<EditAccountController>().userIsReady = false;
        } else {
          context.read<EditAccountController>().userIsReady = true;
        }
      }).catchError((e, s) {
        Helpers.debugLog('An error occurred: $e');
      });
    }
  }
}
