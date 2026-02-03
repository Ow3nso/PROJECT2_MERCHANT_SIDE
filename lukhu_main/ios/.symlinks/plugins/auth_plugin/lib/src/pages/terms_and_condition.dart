import 'package:auth_plugin/src/controllers/gift/gifts_controller.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        DefaultBackButton,
        DefaultIconBtn,
        GlobalAppUtil,
        LuhkuAppBar,
        ReadContext;

import '../utils/app_util.dart';

class TermsConditionPage extends StatelessWidget {
  const TermsConditionPage({super.key});
  static const routeName = 'terms';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = context.read<GiftsController>().terms.entries.toList();
    return Scaffold(
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        backAction: const DefaultBackButton(),
        color: Theme.of(context).colorScheme.onPrimary,
        enableShadow: true,
        title: Text(
          "Terms and Conditions",
          style: TextStyle(
            color: Theme.of(context).colorScheme.scrim,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        height: 90,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: DefaultIconBtn(
              assetImage: AppUtil.callIcon,
              onTap: () {},
              packageName: GlobalAppUtil.productListingPackageName,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 15),
              child: Text(
                'Lukhu Gift Card Terms and Conditions',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.scrim,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: controller.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(text: '${index + 1}.', children: [
                          TextSpan(
                            text: ' ${controller[index].key}: ',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.scrim,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: '${controller[index].value}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.scrim,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
