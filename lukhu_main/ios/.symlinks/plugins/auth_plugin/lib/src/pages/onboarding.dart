import 'package:auth_plugin/src/controllers/auth/sign_up_flow.dart';
import 'package:auth_plugin/src/pages/sign_up.dart';
// import 'package:auth_plugin/src/pages/sizes_selection.dart';
import 'package:auth_plugin/src/widgets/data_sets/category_cards.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/user_account_type.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        DefaultBackButton,
        Helpers,
        LuhkuAppBar,
        NavigationService,
        ReadContext;
import '../const/auth_constants.dart';
import '../widgets/buttons/default_auth_btn.dart';

class CategorySelectionView extends StatelessWidget {
  const CategorySelectionView({
    super.key,
  });
  static const routeName = 'category-selection';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var data0 = ModalRoute.of(context)!.settings.arguments;
    Helpers.debugLog("[ARGS] $data0");
    var data =
        data0 == null ? <String, dynamic>{} : data0 as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: AuthConstants.optionCardBackgroundBlue,
      appBar: data.isEmpty
          ? LuhkuAppBar(
              color: Theme.of(context).colorScheme.onPrimary,
              enableShadow: true,
              height: 90,
              backAction: const DefaultBackButton(),
              appBarType: AppBarType.other,
              title: const StepTitle(title: 'Your categories'),
            )
          : null,
      body: SafeArea(
        child: AnimatedBuilder(
            animation: context.read<SignUpFlowController>(),
            builder: (_, c) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (data.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AuthBackButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const StepTitle(title: 'Pick your category...'),
                          const StepSubTitle(
                            subTitle:
                                'Select your preferred categories and we will curate a Lukhu experience just for you',
                          ),
                        ],
                      ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.center,
                      child: GridView.count(
                        childAspectRatio: .8,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children: [
                          ...List.generate(
                              _categories.length,
                              (i) => CategoryCard(
                                  assetImage: _categories[i]['image']!,
                                  selected: context
                                      .read<SignUpFlowController>()
                                      .selectedCategories
                                      .contains(_categories[i]['category']!),
                                  onTap: () {
                                    context
                                        .read<SignUpFlowController>()
                                        .updateCategories(
                                            _categories[i]['category']!);
                                  },
                                  category: _categories[i]['category']!))
                        ],
                      ),
                    )),
                    AuthButton(
                      color: AuthConstants.buttonBlue,
                      label: 'Continue',
                      actionDissabledColor: AuthConstants.buttonBlueDissabled,
                      onTap: context
                              .read<SignUpFlowController>()
                              .selectedCategories
                              .isEmpty
                          ? null
                          : () {
                              if (data.isNotEmpty) {
                                NavigationService.navigate(
                                  context,
                                  //SizesSelectionPage.routeName,
                                  SignUpPage.routeName,
                                  arguments: data,
                                );
                                return;
                              }
                            },
                    ),
                    SizedBox(
                      height: size.height * .10,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  List<Map<String, String>> get _categories => [
        {'category': 'Womenswear', 'image': 'women_wear.png'},
        {'category': 'Menswear', 'image': 'mens_wear.png'},
        {'category': 'Kidswear', 'image': 'kids_wear.png'},
        {'category': 'Unisex', 'image': 'unisex_wear.png'},
      ];
}
