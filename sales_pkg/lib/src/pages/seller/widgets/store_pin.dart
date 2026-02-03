// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
//     show DefaultButton, PinCodeField, StyleColors;

// class PinCard extends StatefulWidget {
//   const PinCard({super.key, required this.userId}); // User ID should be passed

//   final String userId;

//   @override
//   _PinCardState createState() => _PinCardState();
// }

// class _PinCardState extends State<PinCard> {
//   String? firstPin;
//   bool isPinMismatched = false;

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return AnimatedPadding(
//       duration: const Duration(milliseconds: 100),
//       padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//       child: Container(
//         height: 316,
//         width: size.width,
//         padding: const EdgeInsets.only(
//           top: 24,
//           left: 16,
//           right: 16,
//         ),
//         decoration: BoxDecoration(
//           color: StyleColors.lukhuWhite,
//           border: Border.all(
//             color: StyleColors.lukhuDividerColor,
//           ),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Column(
//           children: [
//             Text('Set a PIN to secure your store',
//                 style: TextStyle(
//                   color: StyleColors.lukhuDark,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 16,
//                 )),
//             const SizedBox(height: 8),
//             Text('Do not share your Store PIN with anyone.',
//                 style: TextStyle(
//                   color: StyleColors.lukhuGrey80,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 16,
//                 )),
//             Padding(
//               padding: const EdgeInsets.only(top: 8, bottom: 8),
//               child: PinCodeField(
//                 fieldHeight: 70,
//                 fieldWidth: 60,
//                 codeLength: 4,
//                 onCompleted: (s) async {
//                   setState(() {
//                     firstPin = s;
//                   });
//                   await Future.delayed(const Duration(milliseconds: 500));
//                   if (firstPin != null) {
//                     // Show confirm PIN dialog
//                     showDialog(
//                       context: context,
//                       builder: (context) => ConfirmPinCard(
//                         firstPin: firstPin!,
//                         userId: widget.userId,
//                         onPinConfirmed: () {
//                           Navigator.pop(context); // Close the confirmation dialog
//                         },
//                       ),
//                     );
//                   }
//                 },
//                 onChanged: (s) {},
//                 textStyle: TextStyle(
//                   color: isPinMismatched ? Colors.red : StyleColors.lukhuBlue,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(
//                     color: isPinMismatched ? Colors.red : StyleColors.lukhuBlue,
//                   ),
//                 ),
//               ),
//             ),
//             DefaultButton(
//               label: 'Continue',
//               color: StyleColors.lukhuBlue,
//               width: size.width - 32,
//               onTap: () {},
//             ),
//             const SizedBox(height: 8),
//             DefaultButton(
//               label: 'Cancel',
//               color: StyleColors.lukhuWhite,
//               width: size.width - 32,
//               boarderColor: StyleColors.lukhuDividerColor,
//               textColor: StyleColors.lukhuDark1,
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             const SizedBox(height: 8),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ConfirmPinCard extends StatefulWidget {
//   final String firstPin;
//   final String userId;
//   final VoidCallback onPinConfirmed;

//   const ConfirmPinCard({
//     super.key,
//     required this.firstPin,
//     required this.userId,
//     required this.onPinConfirmed,
//   });

//   @override
//   _ConfirmPinCardState createState() => _ConfirmPinCardState();
// }

// class _ConfirmPinCardState extends State<ConfirmPinCard> {
//   bool isPinMismatched = false;

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return AnimatedPadding(
//       duration: const Duration(milliseconds: 100),
//       padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//       child: Container(
//         height: 316,
//         width: size.width,
//         padding: const EdgeInsets.only(
//           top: 24,
//           left: 16,
//           right: 16,
//         ),
//         decoration: BoxDecoration(
//           color: StyleColors.lukhuWhite,
//           border: Border.all(
//             color: StyleColors.lukhuDividerColor,
//           ),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Column(
//           children: [
//             Text('Confirm your PIN',
//                 style: TextStyle(
//                   color: StyleColors.lukhuDark,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 16,
//                 )),
//             const SizedBox(height: 8),
//             Text('Re-enter your PIN to confirm.',
//                 style: TextStyle(
//                   color: StyleColors.lukhuGrey80,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 16,
//                 )),
//             Padding(
//               padding: const EdgeInsets.only(top: 8, bottom: 8),
//               child: PinCodeField(
//                 fieldHeight: 70,
//                 fieldWidth: 60,
//                 codeLength: 4,
//                 onCompleted: (s) async {
//                   setState(() {
//                     // Change flag if pins don't match
//                     isPinMismatched = s != widget.firstPin;
//                   });

//                   if (!isPinMismatched) {
//                     // Save the PIN to Firebase Firestore
//                     await _savePinToFirestore(widget.firstPin, widget.userId);
//                     widget.onPinConfirmed(); // Notify parent that PIN is confirmed
//                     Navigator.pop(context); // Close the confirmation dialog
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('PINs do not match. Please try again.'),
//                       ),
//                     );
//                   }
//                 },
//                 onChanged: (s) {},
//                 textStyle: TextStyle(
//                   color: isPinMismatched ? Colors.red : StyleColors.lukhuBlue,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(
//                     color: isPinMismatched ? Colors.red : StyleColors.lukhuBlue,
//                   ),
//                 ),
//               ),
//             ),
//             DefaultButton(
//               label: 'Continue',
//               color: StyleColors.lukhuBlue,
//               width: size.width - 32,
//               onTap: () {},
//             ),
//             const SizedBox(height: 8),
//             DefaultButton(
//               label: 'Cancel',
//               color: StyleColors.lukhuWhite,
//               width: size.width - 32,
//               boarderColor: StyleColors.lukhuDividerColor,
//               textColor: StyleColors.lukhuDark1,
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             const SizedBox(height: 8),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _savePinToFirestore(String pin, String userId) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection('users_store_pin') // Assuming you have a 'users' collection
//           .doc(userId) // Store the PIN for the authenticated user
//           .update({
//         'storePin': pin,
//       });
//       print("PIN saved successfully!");
//     } catch (e) {
//       print("Error saving PIN: $e");
//     }
//   }
// }
