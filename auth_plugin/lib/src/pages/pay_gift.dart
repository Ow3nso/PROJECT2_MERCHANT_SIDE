import 'package:auth_plugin/src/pages/your_gifts.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        BlurDialogBody,
        ConfirmationCard,
        DefaultBackButton,
        DefaultIconBtn,
        GlobalAppUtil,
        LoaderCard,
        LuhkuAppBar,
        NavigationService,
        ReadContext,
        StepperTitle,
        WatchContext;

import '../controllers/gift/gifts_controller.dart';
import '../utils/app_util.dart';
import '../widgets/gift_card/gift_bottom.dart';
import '../widgets/gift_card/gift_detail.dart';
import '../widgets/gift_card/gift_label.dart';
import '../widgets/gift_card/select_payment.dart';

class PayGiftPage extends StatefulWidget {
  const PayGiftPage({super.key});
  static const routeName = 'pay';

  @override
  State<PayGiftPage> createState() => _PayGiftPageState();
}

class _PayGiftPageState extends State<PayGiftPage> {
  PageController pageController = PageController();
  int _selectIndex = 0;

  void _setPage(int index) {
    setState(() {
      _selectIndex = index;
    });
    pageController.animateToPage(
      index,
      curve: Curves.bounceIn,
      duration: AppUtil.animationDuration,
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var value = context.read<GiftsController>().isGiftForSelf;
      if (value) {
        _setPage(1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = context.watch<GiftsController>();
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            appBar: LuhkuAppBar(
              appBarType: AppBarType.other,
              backAction: const DefaultBackButton(),
              color: Theme.of(context).colorScheme.onPrimary,
              enableShadow: true,
              centerTitle: true,
              title: Text(
                "Buy a Gift Card",
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
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(controller.giftPayProcess.length,
                          (index) {
                        return StepperTitle(
                          onTap: () {
                            if (index != controller.giftPayProcess.length - 1) {
                              context.read<GiftsController>().checkDetails(() {
                                _setPage(index);
                                pageController.animateToPage(
                                  index,
                                  curve: Curves.bounceIn,
                                  duration: AppUtil.animationDuration,
                                );
                              }, index);
                            }
                          },
                          index: index + 1,
                          isActive: _selectIndex == index,
                          title: controller.giftPayProcess[index]['title'],
                          data: controller.giftPayProcess[index],
                          showDivider:
                              index != controller.giftPayProcess.length - 1,
                        );
                      }),
                    ),
                  ),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16, left: 16),
                        child: GiftLabel(size: size),
                      ),
                      SizedBox(
                        width: size.width,
                        height: 600,
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: _views.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => _views[index],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            bottomSheet: MediaQuery.of(context).viewInsets.bottom > 0
                ? null
                : GiftBottom(
                    onTap: context.watch<GiftsController>().allowComplete
                        ? () {
                            context.read<GiftsController>().startTimer(() {
                              _showConfirm(context);
                            });
                          }
                        : null,
                  ),
          ),
          if (controller.showGlow)
            const Positioned(
              child: LoaderCard(
                title:
                    'You’re almost there! We are processing your order payment',
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> get _views => [
        const GiftDetail(),
        const SelectPayment(),
        Container(),
      ];

  void _showConfirm(BuildContext context) {
    var controller = context.read<GiftsController>();
    showDialog(
        context: context,
        builder: (ctx) {
          return BlurDialogBody(
            bottomDistance: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ConfirmationCard(
                height: 300,
                title: 'Your order has been confirmed',
                description:
                    'Your Gift Card will be sent to your email address and to your Lukhu account.',
                primaryLabel: 'View my Gift Cards',
                onPrimaryTap: () {
                  _clear(controller, context);
                },
                secondaryLabel: 'Cancel',
                onSecondaryTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          );
        });
  }

  void _clear(GiftsController controller, BuildContext context) {
    controller.clear();
    _setPage(0);
    pageController.animateToPage(
      0,
      curve: Curves.bounceIn,
      duration: AppUtil.animationDuration,
    );
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    NavigationService.navigate(context, YourGiftPage.routeName);
  }
}
