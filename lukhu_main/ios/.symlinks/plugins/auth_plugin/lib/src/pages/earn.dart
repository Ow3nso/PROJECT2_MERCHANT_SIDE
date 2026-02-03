import 'package:auth_plugin/src/controllers/earn/earn_lukhu_controller.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        BlurDialogBody,
        ConfirmationCard,
        DefaultBackButton,
        LuhkuAppBar,
        ReadContext;
import '../widgets/buttons/default_call_btn.dart';
import '../widgets/earn/earn_card.dart';

class EarnPage extends StatelessWidget {
  const EarnPage({super.key});
  static const routeName = 'earn';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = context.read<EarnWithLukhuController>();
    return Scaffold(
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        backAction: const DefaultBackButton(),
        color: Theme.of(context).colorScheme.onPrimary,
        enableShadow: true,
        title: Text(
          "Earn with Lukhu",
          style: TextStyle(
            color: Theme.of(context).colorScheme.scrim,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        height: 90,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
              itemCount: controller.earnings.length,
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) {
                var data = controller.earnings[index];
                return EarnCard(
                  data: data,
                  onTap: () {
                    show(context);
                  },
                );
              }),
        ),
      ),
    );
  }

  void show(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return BlurDialogBody(
              bottomDistance: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ConfirmationCard(
                  title: 'Awesome!',
                  description:
                      'You will be notified once the Lukhu Influencers program is launched!',
                  height: 292,
                  primaryLabel: 'Okay',
                  onPrimaryTap: () {
                    Navigator.of(context).pop();
                  },
                  secondaryLabel: 'Cancel',
                  onSecondaryTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ));
        });
  }
}
