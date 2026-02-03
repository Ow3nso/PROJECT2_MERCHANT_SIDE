import 'package:flutter/material.dart';

import '../../utils/app_util.dart';

class LuhkuMainLogo extends StatelessWidget {
  const LuhkuMainLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppUtil.luhkuMainLogo,package: AppUtil.packageName,);
  }
}