import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultButton, PinCodeField, StyleColors;

class PinCard extends StatefulWidget {
  const PinCard({super.key});

  @override
  _PinCardState createState() => _PinCardState();
}

class _PinCardState extends State<PinCard> {
  String? firstPin;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedPadding(
      duration: const Duration(milliseconds: 100),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 316,
        width: size.width,
        padding: const EdgeInsets.only(
          top: 24,
          left: 16,
          right: 16,
        ),
        decoration: BoxDecoration(
          color: StyleColors.lukhuWhite,
          border: Border.all(
            color: StyleColors.lukhuDividerColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text('Set a PIN to secure your store',
                style: TextStyle(
                  color: StyleColors.lukhuDark,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                )),
            const SizedBox(
              height: 8,
            ),
            Text('Do not share your Store PIN with anyone.',
                style: TextStyle(
                  color: StyleColors.lukhuGrey80,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: PinCodeField(
                fieldHeight: 70,
                fieldWidth: 60,
                codeLength: 4,
                onCompleted: (s) async {
                  setState(() {
                    firstPin = s;
                  });
                  await Future.delayed(const Duration(milliseconds: 500));
                  if (firstPin != null) {
                    showDialog(
                      context: context,
                      builder: (context) => ConfirmPinCard(firstPin: firstPin!),
                    );
                  }
                },
                onChanged: (s) {},
              ),
            ),
            DefaultButton(
              label: 'Continue',
              color: StyleColors.lukhuBlue,
              width: size.width - 32,
              onTap: () {},
            ),
            const SizedBox(height: 8),
            DefaultButton(
              label: 'Cancel',
              color: StyleColors.lukhuWhite,
              width: size.width - 32,
              boarderColor: StyleColors.lukhuDividerColor,
              textColor: StyleColors.lukhuDark1,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class ConfirmPinCard extends StatelessWidget {
  final String firstPin;
  const ConfirmPinCard({super.key, required this.firstPin});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedPadding(
      duration: const Duration(milliseconds: 100),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 316,
        width: size.width,
        padding: const EdgeInsets.only(
          top: 24,
          left: 16,
          right: 16,
        ),
        decoration: BoxDecoration(
          color: StyleColors.lukhuWhite,
          border: Border.all(
            color: StyleColors.lukhuDividerColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text('Confirm your PIN',
                style: TextStyle(
                  color: StyleColors.lukhuDark,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                )),
            const SizedBox(
              height: 8,
            ),
            Text('Re-enter your PIN to confirm.',
                style: TextStyle(
                  color: StyleColors.lukhuGrey80,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: PinCodeField(
                fieldHeight: 70,
                fieldWidth: 60,
                codeLength: 4,
                onCompleted: (s) async {
                  if (s == firstPin) {
                    // PINs match, proceed further
                    Navigator.pop(context); // Close the confirmation dialog
                    Navigator.pop(context); // Close the initial dialog
                  } else {
                    // PINs do not match, show error
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('PINs do not match. Please try again.'),
                      ),
                    );
                  }
                },
                onChanged: (s) {},
              ),
            ),
            DefaultButton(
              label: 'Continue',
              color: StyleColors.lukhuBlue,
              width: size.width - 32,
              onTap: () {},
            ),
            const SizedBox(height: 8),
            DefaultButton(
              label: 'Cancel',
              color: StyleColors.lukhuWhite,
              width: size.width - 32,
              boarderColor: StyleColors.lukhuDividerColor,
              textColor: StyleColors.lukhuDark1,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
