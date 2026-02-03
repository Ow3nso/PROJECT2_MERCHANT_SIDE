import 'dart:async';

import 'package:dukastax_pkg/src/widgets/dukastax/page_content.dart';
import 'package:dukastax_pkg/utils/app_util.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppType,
        DefaultButton,
        DukastaxOnboard,
        NavigationService,
        PasswordLoginPage,
        ReadContext,
        StyleColors,
        UserRepository;

class DukastaxGenesis extends StatefulWidget {
  const DukastaxGenesis({super.key});
  static String routeName = "dukastax";

  @override
  State<DukastaxGenesis> createState() => _DukastaxGenesisState();
}

class _DukastaxGenesisState extends State<DukastaxGenesis> {
  final pageController = PageController();

  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<UserRepository>().userAuthenticated) {
        NavigationService.navigate(context, '/', forever: true);
      } else {
        _startScroll();
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  void _startScroll() async {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < AppUtil.dukastaxIntro.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var introSlides = AppUtil.dukastaxIntro;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: kToolbarHeight),
              child: Image.asset(
                AppUtil.dukastaxIcon,
                package: AppUtil.packageName,
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => PageContent(
                  data: introSlides[index],
                ),
                itemCount: introSlides.length,
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
            ),
            DefaultButton(
              label: "Create Account",
              actionDissabledColor: StyleColors.buttonBlueDissabled,
              color: StyleColors.lukhuBlue,
              height: 40,
              width: MediaQuery.sizeOf(context).width - 32,
              onTap: () {
                NavigationService.navigate(
                  context,
                  DukastaxOnboard.routeName,
                  arguments: {
                    "type": AppType.dukastax,
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 88),
              child: DefaultButton(
                label: "Login",
                actionDissabledColor: StyleColors.buttonBlueDissabled,
                color: StyleColors.lukhuWhite,
                textColor: StyleColors.lukhuBlue,
                height: 40,
                width: MediaQuery.sizeOf(context).width - 32,
                boarderColor: StyleColors.lukhuBlue,
                onTap: () {
                  NavigationService.navigate(
                      context, PasswordLoginPage.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
