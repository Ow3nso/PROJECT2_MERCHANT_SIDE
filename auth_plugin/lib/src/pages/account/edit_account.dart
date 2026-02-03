import 'package:auth_plugin/src/controllers/auth/edit_account_controller.dart';
import 'package:auth_plugin/src/widgets/blur_dialog_body.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        DefaultBackButton,
        LuhkuAppBar,
        ReadContext,
        StyleColors,
        WatchContext;

import '../../../auth_plugin.dart';

import '../../widgets/account/edit_card.dart';
import '../../widgets/account/profile_image.dart';
import '../../widgets/account/social_container.dart';
import '../../widgets/account/update_profile.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({super.key});
  static const routeName = 'edit_profile';

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<EditAccountController>()
          .init(context.read<UserRepository>().user!);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        backAction: const DefaultBackButton(),
        color: Theme.of(context).colorScheme.onPrimary,
        enableShadow: true,
        title: Text(
          "Your Profile",
          style: TextStyle(
            color: Theme.of(context).colorScheme.scrim,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: DefaultCallBtn(),
          ),
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 24),
              child: Center(
                child: ProfileImage(
                  onTap: () {
                    show(
                      context,
                      const AddProfilePhotoView(
                        label: 'Cancel',
                      ),
                    );
                  },
                  image: context.watch<UserRepository>().user?.imageUrl,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: StyleColors.lukhuDividerColor))),
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 8,
              ),
              child: Text(
                'Your Details',
                style: TextStyle(
                  color: StyleColors.pink,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            EditCard(
              title: 'First Name',
              description:
                  context.watch<UserRepository>().user?.firstName ?? "",
              onTap: () {
                show(
                  context,
                  UpdateProfile(
                    index: 0,
                    onTap: () {},
                  ),
                );
              },
            ),
            EditCard(
              title: 'Last Name',
              // description: context.watch<UserRepository>().user?.lastName ?? "",
              description: context.watch<UserRepository>().user?.lastName ?? "",
              onTap: () {
                show(
                  context,
                  UpdateProfile(
                    index: 1,
                    onTap: () {},
                  ),
                );
              },
            ),
            EditCard(
              title: 'Phone Number',
              description:
                  context.watch<UserRepository>().user?.phoneNumber ?? "",
              onTap: () {
                show(
                  context,
                  UpdateProfile(
                    index: 2,
                    onTap: () {},
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 10),
              child: SocialContainer(),
            ),
          ],
        ),
      ),
    );
  }

  String getUserData(TextEditingController controller, String dataValue) {
    return controller.text.isEmpty ? dataValue : controller.text;
  }

  void show(BuildContext context, Widget child) {
    showDialog(
        context: context,
        builder: (ctx) {
          return BlurDialogBody(
            bottomDistance: 80,
            child: WillPopScope(
              onWillPop: () async => false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: child,
              ),
            ),
          );
        });
  }
}
