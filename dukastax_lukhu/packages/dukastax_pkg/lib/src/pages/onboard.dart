import 'package:dukastax_pkg/src/controllers/dukastax_controller.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppType,
        CategorySelectionView,
        DefaultButton,
        NavigationService,
        ReadContext,
        SellerExperienceCard,
        StepSubTitle,
        StepTitle,
        StyleColors,
        WatchContext,
        DefaultBackButton;

import '../../utils/app_util.dart';

class DukastaxOnboard extends StatelessWidget {
  const DukastaxOnboard({super.key});
  static const routeName = "dukastax_onboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: kToolbarHeight,
              ),
              const Row(
                children: [
                  DefaultBackButton(),
                  StepTitle(title: 'How do you sell?'),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: StepSubTitle(
                    subTitle:
                        'Tell us about your selling experience and we’ll get your online store ready in a few'),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _dukastaxExperience.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: MediaQuery.sizeOf(context).height * .15,
                      childAspectRatio: .9,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (_, index) => SellerExperienceCard(
                    packageName: AppUtil.packageName,
                    color: StyleColors.lukhuDark1,
                    assetImage: _dukastaxExperience[index]["image"],
                    title: _dukastaxExperience[index]["title"],
                    selected:
                        context.watch<DukastaxController>().sellerExperience ==
                            _dukastaxExperience[index]["title"],
                    onTap: () {
                      context.read<DukastaxController>().sellerExperience =
                          _dukastaxExperience[index]["title"];
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 144, left: 16, right: 16),
                child: DefaultButton(
                  label: "Continue",
                  actionDissabledColor: StyleColors.lukhuDisabledButtonColor,
                  onTap: context
                          .watch<DukastaxController>()
                          .sellerExperience
                          .isEmpty
                      ? null
                      : () {
                          NavigationService.navigate(
                            context,
                            CategorySelectionView.routeName,
                            arguments: {
                              "type": AppType.dukastax,
                              "selected": context
                                  .read<DukastaxController>()
                                  .sellerExperience
                            },
                          );
                        },
                  height: 40,
                  color: StyleColors.lukhuBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> get _dukastaxExperience => [
        {
          "title": "I just started selling",
          "image": "assets/icons/shop-add",
        },
        {
          "title": "I sell offline only",
          "image": "assets/icons/building",
        },
        {
          "title": "I sell online already",
          "image": "assets/icons/global",
        },
        {
          "title": "I sell online and offline",
          "image": "assets/icons/map",
        },
        {
          "title": "I'm opening a shop for someone else",
          "image": "assets/icons/user-add",
        },
        {
          "title": "I'm just looking around",
          "image": "assets/icons/eye",
        },
      ];
}
