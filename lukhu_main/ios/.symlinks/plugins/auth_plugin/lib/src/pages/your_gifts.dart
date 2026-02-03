import 'package:auth_plugin/auth_plugin.dart';
import 'package:auth_plugin/src/controllers/gift/gifts_controller.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        BlurDialogBody,
        DefaultBackButton,
        LuhkuAppBar,
        ReadContext;

import '../widgets/gift_card/balance_card.dart';
import '../widgets/gift_card/gift_tile.dart';

class YourGiftPage extends StatelessWidget {
  const YourGiftPage({super.key});
  static const routeName = 'gifts';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var items = context.read<GiftsController>().availableGifts;
    return Scaffold(
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        backAction: const DefaultBackButton(),
        color: Theme.of(context).colorScheme.onPrimary,
        enableShadow: true,
        title: Text(
          "Your Gift Cards",
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
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .764,
                crossAxisSpacing: 16,
                mainAxisSpacing: 8,
                mainAxisExtent: 163,
              ),
              itemBuilder: (context, index) {
                var data = items[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Theme.of(context).colorScheme.onPrimary),
                    child: GiftTile(
                      data: data,
                      onTap: () {
                        showBalanceCard(context);
                      },
                    ),
                  ),
                );
              },
              itemCount: items.length,
            ),
          )),
    );
  }

  void showBalanceCard(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return BlurDialogBody(
            child: GiftCardBalance(
              label: 'Your Gift Card',
              onTap: () {},
            ),
          );
        });
  }
}
