import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../pages/services/api_service/api_service.dart';
import '../../../pages/services/api_service/store_pin_service.dart';


class SetPinCard extends StatefulWidget {
  const SetPinCard({super.key});

  @override
  _SetPinCardState createState() => _SetPinCardState();
}

class _SetPinCardState extends State<SetPinCard> {
  final AuthService authService = AuthService();
  String? currentText;
  String? firstPin;
  String pin = '';
  String verificationId = "";
  final FirebaseAuth auth = FirebaseAuth.instance;
  final _secureStorage = const FlutterSecureStorage(); // Secure storage instance
  final TextEditingController pinController = TextEditingController();

  int _timeRemaining = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeRemaining > 0) {
        setState(() {
          _timeRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _resendCode() {
    setState(() {
      _timeRemaining = 60; // Reset the timer
      startTimer(); // Restart the timer
    });
  }

  Future<void> _savePin(BuildContext context) async {
    await savePin(context, pin);
    print('Saving PIN: $pin');
  }

  Future<void> _verifyStoredPin(String enteredPin) async {
    String? storedPin = await _secureStorage.read(key: 'user_pin');
    if (storedPin == enteredPin) {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(SnackBar(content: Text('Login successful.')));
      // Navigate to the main page or perform any other actions upon successful login
    } else {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(SnackBar(content: Text('Incorrect PIN. Please try again.')));
    }
  }

  void _login() {
    if (currentText != null) {
      authService.verifyOtp(currentText!);
    } else {
      Get.snackbar(
        "Enter 6-Digit code",
        "Failed",
        colorText: Colors.white,
      );
    }
  }


  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return AnimatedPadding(
      duration: const Duration(milliseconds: 100),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 270,
        width: size.width,
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
        decoration: BoxDecoration(
          color: StyleColors.lukhuWhite,
          border: Border.all(color: StyleColors.lukhuDividerColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              'Set a PIN to secure your store',
              style: TextStyle(
                color: StyleColors.lukhuDark,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Do not share your Store PIN with anyone.',
              style: TextStyle(
                color: StyleColors.lukhuGrey80,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: PinCodeField(
                fieldHeight: 70,
                fieldWidth: 60,
                codeLength: 4,
                onCompleted: (s) async {
                  await Future.delayed(const Duration(milliseconds: 300));
                  Navigator.pop(context);
                  _showConfirmationDialog(context, s); // Pass the entered PIN to the confirmation dialog
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
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, String firstPin) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        var size = MediaQuery.of(context).size;
        return AnimatedPadding(
          duration: const Duration(milliseconds: 100),
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: 316,
            width: size.width,
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
            decoration: BoxDecoration(
              color: StyleColors.lukhuWhite,
              border: Border.all(color: StyleColors.lukhuDividerColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  'Confirm your Store PIN',
                  style: TextStyle(
                    color: StyleColors.lukhuDark,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Do not share your Store PIN with anyone',
                  style: TextStyle(
                    color: StyleColors.lukhuGrey80,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: PinCodeField(
                    fieldHeight: 70,
                    fieldWidth: 60,
                    codeLength: 4,
                    onCompleted: (s) async {
                      if (s == firstPin) {
                        // await _savePin(context);
                        Navigator.pop(context); 
                        await authService.signInWithPhoneNumber(
                          '+254113039013',
                        );
                        _showOTPDialog(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('PINs do not match. Please try again.')));
                      }
                    },
                    onChanged: (s) {
                      pin = s;
                    },
                  ),
                ),
                DefaultButton(
                  label: 'Continue',
                  color: StyleColors.lukhuBlue,
                  width: size.width - 32,
                  onTap: () async {
                  //   await signInWithPhoneNumber(
                  //     '+254707394018'
                  //   // '+${widget.signUpFlowController.phoneController.text.toLukhuNumber()}',
                  // );
                  //   Navigator.pop(context);
                  },
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
      },
    );
  }

  void _showOTPDialog(BuildContext context) {
    String otp = ''; // State variable to hold the OTP

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        var size = MediaQuery.of(context).size;
        return AnimatedPadding(
          duration: const Duration(milliseconds: 100),
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: 350,
            width: size.width,
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
            decoration: BoxDecoration(
              color: StyleColors.lukhuWhite,
              border: Border.all(color: StyleColors.lukhuDividerColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  'Enter one-time password',
                  style: TextStyle(
                    color: StyleColors.lukhuDark,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please enter the 6-digit code sent to your phone',
                  style: TextStyle(
                    color: StyleColors.lukhuGrey80,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: PinCodeField(
                    fieldHeight: 70,
                    fieldWidth: 50,
                    codeLength: 6,
                    onCompleted: (s) async {
                      otp = s; // Store OTP when completed
                    },
                    onChanged: (s) {
                      otp = s; // Update OTP as the user types
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(children: [
                    Text(
                      'Time remaining: 00:${_timeRemaining.toString().padLeft(2, '0')}',
                      style: TextStyle(fontSize: 14),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: _resendCode, // Resend the OTP code
                      child: const Text(
                        'Resend code',
                        style: TextStyle(
                          color: Color(0xFF003cFF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
                ),
                DefaultButton(
                  label: 'Continue',
                  color: StyleColors.lukhuBlue,
                  width: size.width - 32,
                  onTap: () async {
                    if (otp.length == 6) {
                      bool isOtpValid = await authService.verifyOtp(otp);
                      if (isOtpValid) {
                        // OTP is correct, save the PIN
                        await _savePin(context);
                        Navigator.of(context).pop();
                      } else {
                        // Show an error message if OTP is invalid
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid OTP. Please try again.')),
                        );
                        print('invalid otp');
                      }
                    } else {
                      // Show an error message if OTP length is not 6
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter a valid 6-digit OTP.')),
                      );
                    }
                  },
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
      },
    );
  }



}


class PinCard extends StatefulWidget {
  const PinCard({super.key});

  @override
  _PinCardState createState() => _PinCardState();
}

class _PinCardState extends State<PinCard> {
  final AuthService authService = AuthService();
  String? currentText;
  String? firstPin;
  String pin = '';
  String verificationId = "";
  final FirebaseAuth auth = FirebaseAuth.instance;
  final _secureStorage = const FlutterSecureStorage(); // Secure storage instance
  final TextEditingController pinController = TextEditingController();
  bool _isPinIncorrect = false;

  int _timeRemaining = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeRemaining > 0) {
        setState(() {
          _timeRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _resendCode() {
    setState(() {
      _timeRemaining = 60; // Reset the timer
      startTimer(); // Restart the timer
    });
  }

  Future<void> _savePin(BuildContext context) async {
    await savePin(context, pin);
    print('Saving PIN: $pin');
  }

  Future<void> _verifyStoredPin(String enteredPin) async {
    String? storedPin = await _secureStorage.read(key: 'user_pin');
    if (storedPin == enteredPin) {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(SnackBar(content: Text('Login successful.')));
      // Navigate to the main page or perform any other actions upon successful login
    } else {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(SnackBar(content: Text('Incorrect PIN. Please try again.')));
    }
  }

  Future<void> _confirmPin(BuildContext context) async {
    await confirmPin(context, pin);
    print('Confirming PIN: $pin');
    bool success = await  confirmPin(context, pin);

    if (success) {
      setState(() {
        _isPinIncorrect = false;
      });
      Navigator.of(context).pop();
    } else {
      setState(() {
        _isPinIncorrect = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedPadding(
      duration: const Duration(milliseconds: 100),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 320,
        width: size.width,
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
        decoration: BoxDecoration(
          color: StyleColors.lukhuWhite,
          border: Border.all(color: StyleColors.lukhuDividerColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              'Enter your pin',
              style: TextStyle(
                color: StyleColors.lukhuDark,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Do not share your Store PIN with anyone.',
              style: TextStyle(
                color: StyleColors.lukhuGrey80,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: PinCodeField(
                fieldHeight: 70,
                fieldWidth: 60,
                codeLength: 4,
                onCompleted: (s) {
                  setState(() {
                    pin = s;
                  });
                },
                onChanged: (s) {
                  pin = s;
                },
              ),
            ),
            if (_isPinIncorrect)
              const Text(
                'Incorrect pin',
                style: TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 5),
            DefaultButton(
              label: 'Continue',
              color: StyleColors.lukhuBlue,
              width: size.width - 32,
              onTap: () async {
                await _confirmPin(context);
              },
            ),
            const SizedBox(height: 8),
            DefaultButton(
              label: 'Reset PIN',
              color: StyleColors.lukhuWhite,
              width: size.width - 32,
              boarderColor: StyleColors.lukhuDividerColor,
              textColor: StyleColors.lukhuDark1,
              onTap: () async  {
                await authService.signInWithPhoneNumber(
                  '+254113039013'
                  // '+${widget.signUpFlowController.phoneController.text.toLukhuNumber()}',
                );
                Navigator.pop(context);
                _showOTPDialog(context);
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _showOTPDialog(BuildContext context) {
    String otp = ''; // State variable to hold the OTP

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        var size = MediaQuery.of(context).size;
        return AnimatedPadding(
          duration: const Duration(milliseconds: 100),
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: 350,
            width: size.width,
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
            decoration: BoxDecoration(
              color: StyleColors.lukhuWhite,
              border: Border.all(color: StyleColors.lukhuDividerColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  'Enter one-time password',
                  style: TextStyle(
                    color: StyleColors.lukhuDark,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please enter the 6-digit code sent to your phone',
                  style: TextStyle(
                    color: StyleColors.lukhuGrey80,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: PinCodeField(
                    fieldHeight: 70,
                    fieldWidth: 50,
                    codeLength: 6,
                    onCompleted: (s) async {
                      otp = s; // Store OTP when completed
                    },
                    onChanged: (s) {
                      otp = s; // Update OTP as the user types
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(children: [
                    Text(
                      'Time remaining: 00:${_timeRemaining.toString().padLeft(2, '0')}',
                      style: TextStyle(fontSize: 14),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: _resendCode, // Resend the OTP code
                      child: const Text(
                        'Resend code',
                        style: TextStyle(
                          color: Color(0xFF003cFF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
                ),
                DefaultButton(
                  label: 'Continue',
                  color: StyleColors.lukhuBlue,
                  width: size.width - 32,
                  onTap: () async {
                    if (otp.length == 6) {
                      bool isOtpValid = await authService.verifyOtp(otp);
                      if (isOtpValid) {
                        Navigator.pop(context)
;                        _showSetPinDialog(context);
                      } else {
                        // Show an error message if OTP is invalid
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid OTP. Please try again.')),
                        );
                        print('invalid otp');
                      }
                    } else {
                      // Show an error message if OTP length is not 6
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter a valid 6-digit OTP.')),
                      );
                    }
                  },
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
      },
    );
  }

  void _showSetPinDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        var size = MediaQuery.of(context).size;
        return AnimatedPadding(
          duration: const Duration(milliseconds: 100),
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: 270,
            width: size.width,
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
            decoration: BoxDecoration(
              color: StyleColors.lukhuWhite,
              border: Border.all(color: StyleColors.lukhuDividerColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  'Set a PIN to secure your store',
                  style: TextStyle(
                    color: StyleColors.lukhuDark,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Do not share your Store PIN with anyone.',
                  style: TextStyle(
                    color: StyleColors.lukhuGrey80,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: PinCodeField(
                    fieldHeight: 70,
                    fieldWidth: 60,
                    codeLength: 4,
                    onCompleted: (s) async {
                      await Future.delayed(const Duration(milliseconds: 300));
                      Navigator.pop(context);
                      _showConfirmationDialog(context, s); // Pass the entered PIN to the confirmation dialog
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
              ],
            ),
          ),
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context, String firstPin) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        var size = MediaQuery.of(context).size;
        return AnimatedPadding(
          duration: const Duration(milliseconds: 100),
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: 316,
            width: size.width,
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
            decoration: BoxDecoration(
              color: StyleColors.lukhuWhite,
              border: Border.all(color: StyleColors.lukhuDividerColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  'Confirm your Store PIN',
                  style: TextStyle(
                    color: StyleColors.lukhuDark,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Do not share your Store PIN with anyone',
                  style: TextStyle(
                    color: StyleColors.lukhuGrey80,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: PinCodeField(
                    fieldHeight: 70,
                    fieldWidth: 60,
                    codeLength: 4,
                    onCompleted: (s) async {
                      if (s == firstPin) {
                        await _savePin(context);
                        Navigator.pop(context); // Close the confirmation dialog
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('PINs do not match. Please try again.')));
                      }
                    },
                    onChanged: (s) {
                      pin = s;
                    },
                  ),
                ),
                DefaultButton(
                  label: 'Continue',
                  color: StyleColors.lukhuBlue,
                  width: size.width - 32,
                  onTap: () async {
                  //   await signInWithPhoneNumber(
                  //     '+254707394018'
                  //   // '+${widget.signUpFlowController.phoneController.text.toLukhuNumber()}',
                  // );
                  //   Navigator.pop(context);
                  //   _showOTPDialog(context);
                  },
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
      },
    );
  }
}