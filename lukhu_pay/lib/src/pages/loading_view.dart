import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show 
      // InvoiceModel, 
      LoaderCard, 
      ReadContext; 
      // WatchContext;
// import 'package:lukhu_pay/src/commands/top_command.dart';
// import 'package:lukhu_pay/src/controller/accounts_controller.dart';
import 'package:lukhu_pay/src/controller/payment_controller.dart';

import '../widgets/billing/error_card.dart';
import '../widgets/billing/success_card.dart';
// import '../controller/poll_payment_status.dart';

class LoadingView extends StatefulWidget {
  // final String transactionId; // Add transactionId parameter

  const LoadingView();
  static const routeName = 'loading';

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  bool isLoading = true;
  bool isSuccess = false;

  @override
  void initState() {
    super.initState();
    _startPolling();
  }

  void _startPolling() async {
    // await pollPaymentStatus(context, widget.transactionId);
    if (context.read<PaymentController>().isTopUp) {
      setState(() {
        isSuccess = true;
        isLoading = false;
      });
    } else {
      setState(() {
        isSuccess = false;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.popUntil(context, (route) => false);
        return true;
      },
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: isLoading
                  ? const LoaderCard(
                title: 'Please wait as your top-up request is being processed.',
              )
                  : isSuccess
                  ? SuccessCard(
                onTap: () {},
                title: 'Top-up Successful',
                description:
                'Your wallet top-up request was successful. You can find the details below for your reference.',
                subTitle: 'Top-up Details',
              )
                  : ErrorCard(
                title: 'Top-up Failed',
                description:
                'We were unable to complete your wallet top-up request. Tap below to retry',
                onTap: () {
                  setState(() {
                    isLoading = true;
                    _startPolling();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

