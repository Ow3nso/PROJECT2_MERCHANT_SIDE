import 'dart:developer';

import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:auth_plugin/src/controllers/auth/sign_up_flow.dart';
import 'package:auth_plugin/src/pages/follow_recommendation.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/user_account_type.dart';
import 'package:auth_plugin/src/widgets/sizes_selection/size_selection_view.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        DefaultBackButton,
        LuhkuAppBar,
        NavigationService,
        ReadContext;
import '../widgets/buttons/default_auth_btn.dart';

class SizesSelectionPage extends StatelessWidget {
  const SizesSelectionPage({
    super.key,
  });
  static const routeName = 'size_selection';
  @override
  Widget build(BuildContext context) {
    var data0 = ModalRoute.of(context)!.settings.arguments;
    var data =
        data0 == null ? <String, dynamic>{} : data0 as Map<String, dynamic>;
    log('[DATA]$data');
    return DefaultTabController(
      length: _categoriesLength(context),
      child: Scaffold(
        backgroundColor: AuthConstants.optionCardBackgroundBlue,
        appBar: data.isNotEmpty
            ? LuhkuAppBar(
                color: Theme.of(context).colorScheme.onPrimary,
                enableShadow: true,
                height: 133,
                backAction: const DefaultBackButton(),
                appBarType: AppBarType.other,
                title: const StepTitle(title: 'Your Sizes'),
                bottom: _tabList(context),
              )
            : null,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (data.isEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: StepTitle(title: 'Select your sizes'),
                    ),
                    _tabList(context)
                  ],
                ),
              Divider(
                color: AuthConstants.dividerGrayColor,
                height: 0.5,
              ),
              AnimatedBuilder(
                  animation: context.read<SignUpFlowController>(),
                  builder: (_, c) {
                    return Expanded(
                        child: TabBarView(children: [
                      ...List.generate(
                          _categoriesLength(context),
                          (i) => SizeSelectionView(
                              category: context
                                  .read<SignUpFlowController>()
                                  .selectedCategories[i],
                              signUpFlowController:
                                  context.read<SignUpFlowController>()))
                    ]));
                  })
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 110,
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
                child: AnimatedBuilder(
              animation: context.read<SignUpFlowController>(),
              builder: (_, c) => AuthButton(
                color: AuthConstants.buttonBlue,
                label: data.isEmpty ? 'Continue' : 'Save',
                actionDissabledColor: AuthConstants.buttonBlueDissabled,
                onTap: context.read<SignUpFlowController>().sizesData.isEmpty
                    ? null
                    : () {
                        if (data.isEmpty) {
                          context
                              .read<SignUpFlowController>()
                              .getTrendingSellers();
                          // Go to next option
                          NavigationService.navigate(
                              context, FollowerRecommendetionPage.routeName);
                        } else {
                          Navigator.pop(
                            context,
                            context.read<SignUpFlowController>().sizesData,
                          );
                        }
                      },
              ),
            )),
          ),
        ),
      ),
    );
  }

  TabBar _tabList(BuildContext context) {
    return TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: AuthConstants.dividerGrayColor,
        indicatorColor: AuthConstants.textDarkColor,
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        tabs: [
          ...List.generate(
              _categoriesLength(context),
              (i) => Tab(
                    text: context
                        .read<SignUpFlowController>()
                        .selectedCategories[i],
                  ))
        ]);
  }

  int _categoriesLength(BuildContext context) =>
      context.read<SignUpFlowController>().selectedCategories.length;
}
