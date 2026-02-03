// import 'package:flutter/material.dart';
// import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
//     show
//         CustomColors,
//         GlassmorphicContainer,
//         NumberFormat,
//         ReadContext,
//         WatchContext;
// import 'package:lukhu_pay/src/controller/wallet_controller.dart';
// import 'package:lukhu_pay/src/controller/transaction_controller.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'wallet_text.dart';
// import '../../services/transactions/api_config.dart';

// class BalanceCard extends StatefulWidget {
//   const BalanceCard({super.key, required this.userId});
//   final String userId;

//   @override
//   _BalanceCardState createState() => _BalanceCardState();
// }

// class _BalanceCardState extends State<BalanceCard> {
//   // const BalanceCard({super.key, required this.userId});
//   // final String userId;

//   double _availableBalance = 0;
//   double _pendingBalance = 0;

//   @override
//   void initState() {
//     super.initState();
//     _fetchBalance();
//   }

//   Future<void> _fetchBalance() async {
//     String? idToken = await getFirebaseIdToken(context);
//     String apiUrl = "${ApiConfig.baseUrl}/balance";
//     final response = await http.get(
//       Uri.parse(apiUrl),
//       headers: <String, String>{
//           'Authorization': 'Bearer $idToken',
//           'Content-Type': 'application/json',
//         },
//     );
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       setState(() {
//         _availableBalance = double.tryParse(data['availableBalance'].toString()) ?? 0;
//         _pendingBalance = double.tryParse(data['pendingBalance'].toString()) ?? 0;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return GlassmorphicContainer(
//       height: 180,
//       borderRadius: 8,
//       blur: 2,
//       alignment: Alignment.center,
//       linearGradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             const Color(0xFFffffff).withOpacity(0.2),
//             const Color(0xFFFFFFFF).withOpacity(0.05),
//           ],
//           stops: const [
//             0.1,
//             1,
//           ]),
//       borderGradient: LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: [
//           const Color(0xFFffffff).withOpacity(0.1),
//           const Color((0xFFFFFFFF)).withOpacity(0.5),
//         ],
//       ),
//       width: size.width,
//       border: 1,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             padding: const EdgeInsets.only(top: 22, bottom: 14),
//             child: Column(
//               children: [
//                 Text(
//                   'Available Balance',
//                   style: TextStyle(
//                     color: Theme.of(context).colorScheme.onPrimary,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 WalletText(
//                   description: NumberFormat.currency(
//                     locale: 'en_US',
//                     symbol: 'KES ',
//                   ).format(_availableBalance),
//                   style: TextStyle(
//                     color: Theme.of(context).colorScheme.onPrimary,
//                     fontSize: 40,
//                     fontWeight: FontWeight.w700,
//                   ),
//                   show: context.watch<WalletController>().showBalance,
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(8),
//                 bottomRight: Radius.circular(8),
//               ),
//               color: Theme.of(context).colorScheme.onPrimary,
//             ),
//             padding: const EdgeInsets.only(
//               left: 12,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Pending Balance',
//                       style: TextStyle(
//                         color: Theme.of(context)
//                             .extension<CustomColors>()
//                             ?.sourceNeutral,
//                         fontSize: 10,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     WalletText(
//                       description: NumberFormat.currency(
//                         locale: 'en_US',
//                         symbol: 'KES ',
//                       ).format(_pendingBalance),
//                       style: TextStyle(
//                         color: Theme.of(context)
//                             .extension<CustomColors>()
//                             ?.sourceNeutral,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700,
//                       ),
//                       show: context.watch<WalletController>().showBalance,
//                     ),
//                   ],
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     context.watch<WalletController>().showBalance && context.watch<TransactionController>().showTransactions
//                         ? Icons.visibility_outlined
//                         : Icons.visibility_off_outlined,
//                     color: Theme.of(context).extension<CustomColors>()?.neutral,
//                   ),
//                   onPressed: () {
//                     context.read<WalletController>().showBalance =
//                         !context.read<WalletController>().showBalance;

//                     context.read<TransactionController>().showTransactions =
//                         !context.read<TransactionController>().showTransactions;

//                   },
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        CustomColors,
        GlassmorphicContainer,
        NumberFormat,
        ReadContext,
        WatchContext,
        UserRepository;
import 'package:lukhu_pay/src/controller/wallet_controller.dart';
import 'package:lukhu_pay/src/controller/transaction_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

import 'wallet_text.dart';

class BalanceCard extends StatefulWidget {
  const BalanceCard({super.key, required this.userId});
  final String userId;

  @override
  _BalanceCardState createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  double _availableBalance = 0;
  double _pendingBalance = 0;

  @override
  void initState() {
    super.initState();
    _fetchBalance();
  }

  Future<void> _fetchBalance() async {
    // Access Firestore instance
    final userId = context
        .read<UserRepository>()
        .fbUser
        ?.uid;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Query the wallet collection for the specific user
    QuerySnapshot querySnapshot = await firestore
        .collection('wallet')
        .where('userId', isEqualTo: userId)
        .get();

    // Check if the query returned any documents
    if (querySnapshot.docs.isNotEmpty) {
      // Get the first document (assuming there's only one wallet per user)
      var walletData = querySnapshot.docs.first.data() as Map<String, dynamic>;

      // Update the state with the fetched balances
      setState(() {
        _availableBalance = walletData['availableBalance']?.toDouble() ?? 0;
        _pendingBalance = walletData['pendingBalance']?.toDouble() ?? 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GlassmorphicContainer(
      height: 180,
      borderRadius: 8,
      blur: 2,
      alignment: Alignment.center,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.2),
            const Color(0xFFFFFFFF).withOpacity(0.05),
          ],
          stops: const [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.1),
          const Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      width: size.width,
      border: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 22, bottom: 14),
            child: Column(
              children: [
                Text(
                  'Available Balance',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                WalletText(
                  description: NumberFormat.currency(
                    locale: 'en_US',
                    symbol: 'KES ',
                  ).format(_availableBalance),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                  show: context.watch<WalletController>().showBalance,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            padding: const EdgeInsets.only(
              left: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pending Balance',
                      style: TextStyle(
                        color: Theme.of(context)
                            .extension<CustomColors>()
                            ?.sourceNeutral,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    WalletText(
                      description: NumberFormat.currency(
                        locale: 'en_US',
                        symbol: 'KES ',
                      ).format(_pendingBalance),
                      style: TextStyle(
                        color: Theme.of(context)
                            .extension<CustomColors>()
                            ?.sourceNeutral,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      show: context.watch<WalletController>().showBalance,
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    context.watch<WalletController>().showBalance && context.watch<TransactionController>().showTransactions
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Theme.of(context).extension<CustomColors>()?.neutral,
                  ),
                  onPressed: () {
                    context.read<WalletController>().showBalance =
                        !context.read<WalletController>().showBalance;

                    context.read<TransactionController>().showTransactions =
                        !context.read<TransactionController>().showTransactions;

                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}