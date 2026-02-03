import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        
        CustomerView,
        DefaultInputField,
        GlobalAppUtil,
        LocationController,
        NavigationService,
        PaymethodContainer,
        ReadContext,
        StyleColors,
        WatchContext;
import 'package:product_listing_pkg/product_listing_pkg.dart';

import '../../../../../utils/app_util.dart';

class PaymentDisplay extends StatelessWidget {
  const PaymentDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: StyleColors.lukhuWhite,
        border: Border(
          top: BorderSide(
            color: StyleColors.lukhuDividerColor,
          ),
          bottom: BorderSide(
            color: StyleColors.lukhuDividerColor,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultInputField(
            controller: context.watch<CartController>().customerName,
            label: "Customer Details",
            hintText: "Select Customer",
            readOnly: true,
            onTap: () {
              context.read<LocationController>().retainLocation = true;
              NavigationService.navigate(context, CustomerView.routeName);
            },
            onChange: (value) {},
            prefix: Image.asset(
              AppUtil.userIcon,
              package: GlobalAppUtil.salesPackageName,
            ),
            suffixIcon: Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: StyleColors.lukhuDark1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              'Select a Payment Method',
              style: TextStyle(
                color: StyleColors.lukhuDark1,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
          const PaymethodContainer()
        ],
      ),
    );
  }
}
