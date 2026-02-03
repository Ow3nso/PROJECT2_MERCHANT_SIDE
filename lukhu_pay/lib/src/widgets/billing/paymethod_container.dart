// import 'package:flutter/material.dart';
// import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
//     show
//         AccountType,
//         AccountsController,
//         CircularCheckbox,
//         GlobalAppUtil,
//         ReadContext,
//         ShortMessages,
//         StyleColors,
//         TransactionType,
//         WatchContext;
//
// import '../../../util/app_util.dart';
//
// class PaymethodContainer extends StatelessWidget {
//   const PaymethodContainer({super.key, this.type, this.allowDialog = false});
//   final TransactionType? type;
//   final bool allowDialog;
//
//   @override
//   Widget build(BuildContext context) {
//     var controller = context.watch<AccountsController>();
//     var data = controller.withdrawBillingMethods(type);
//     return ListView.builder(
//       shrinkWrap: true,
//       itemBuilder: (context, index) {
//         var isChecked = data[index]['isChecked'] as bool;
//         var accountType = data[index]['type'] as AccountType;
//         var mpesaAccounts = context
//             .read<AccountsController>()
//             .getUserAccountsByType(AccountType.mpesa);
//
//         var debitAccounts = context
//             .read<AccountsController>()
//             .getUserAccountsByType(AccountType.debit);
//
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 10),
//           child: InkWell(
//             onTap: () {
//               if (mpesaAccounts.isEmpty) {
//                 ShortMessages.showShortMessage(
//                     message: 'Payment accounts not found');
//                 return;
//               }
//               context.read<AccountsController>().pickbilling(index);
//             },
//
//             child: Container(
//               padding: const EdgeInsets.all(10),
//               height: isChecked
//                   ? type != null
//                       ? 200
//                       : 150
//                   : null,
//               width: MediaQuery.sizeOf(context).width,
//               decoration: BoxDecoration(
//                 color: isChecked
//                     ? StyleColors.lukhuBlue10
//                     : StyleColors.lukhuWhite,
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: StyleColors.lukhuDividerColor),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Theme.of(context).colorScheme.onPrimary,
//                           borderRadius: BorderRadius.circular(8),
//                           border: Border.all(
//                             color: StyleColors.lukhuDividerColor,
//                           ),
//                         ),
//                         padding: const EdgeInsets.all(10),
//                         child: Image.asset(
//                           AppUtil.getPayIcon(
//                             data[index]['type'] as AccountType,
//                           ),
//                           package: GlobalAppUtil.productListingPackageName,
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         data[index]['account'],
//                         style: TextStyle(
//                           color: StyleColors.lukhuDark1,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14,
//                         ),
//                       ),
//                       const Spacer(),
//                       Container(
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                                 color: StyleColors.lukhuDividerColor)),
//                         child: CircularCheckbox(
//                           isChecked: (isChecked),
//                         ),
//                       )
//                     ],
//                   ),
//                   if (isChecked)
//                     Expanded(
//                       child: ListView.builder(
//                         itemBuilder: (_, positionIndex) {
//                           var account = context
//                               .read<AccountsController>()
//                               .dataModel(
//                                   positionIndex,
//                                   context
//                                       .watch<AccountsController>()
//                                       .getUserAccountsByType(accountType))!;
//                           return Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 10, right: 10, top: 10),
//                             child: InkWell(
//                               onTap: () {
//                                 context
//                                     .read<AccountsController>()
//                                     .toggleSelectedMethod(account.id!);
//                               },
//                               child: Container(
//                                   padding: const EdgeInsets.all(5),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(4),
//                                       color: StyleColors.lukhuWhite,
//                                       border: Border.all(
//                                         color: StyleColors.lukhuDividerColor,
//                                       )),
//                                   child: Row(
//                                     children: [
//                                       Text(
//                                           "Ending with ${AppUtil.pickLast4Characters(account.account ?? '')}"),
//                                       const Spacer(),
//                                       Container(
//                                         decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             border: Border.all(
//                                                 color: StyleColors
//                                                     .lukhuDividerColor)),
//                                         child: CircularCheckbox(
//                                           isChecked: (context
//                                               .watch<AccountsController>()
//                                               .isPaymodelSelected(
//                                                   account.id ?? "")),
//                                         ),
//                                       )
//                                     ],
//                                   )),
//                             ),
//                           );
//                         },
//                         itemCount: context
//                             .watch<AccountsController>()
//                             .getUserAccountsByType(accountType)
//                             .keys
//                             .length,
//                       ),
//                     )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//       itemCount: data.length,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
    AccountType,
    AccountsController,
    CircularCheckbox,
    GlobalAppUtil,
    ReadContext,
    ShortMessages,
    StyleColors,
    TransactionType,
    WatchContext;

import '../../../util/app_util.dart';

class PaymethodContainer extends StatelessWidget {
  const PaymethodContainer({super.key, this.type, this.allowDialog = false});
  final TransactionType? type;
  final bool allowDialog;

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<AccountsController>();
    var data = controller.withdrawBillingMethods(type);
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var isChecked = data[index]['isChecked'] as bool;
        var accountType = data[index]['type'] as AccountType;
        var mpesaAccounts = context
            .read<AccountsController>()
            .getUserAccountsByType(AccountType.mpesa);

        var debitAccounts = context
            .read<AccountsController>()
            .getUserAccountsByType(AccountType.debit);

        if (accountType == AccountType.mpesa) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: () {
                if (mpesaAccounts.isEmpty) {
                  ShortMessages.showShortMessage(
                      message: 'Payment accounts not found');
                  return;
                }
                context.read<AccountsController>().pickbilling(index);
              },
              child: _buildMpesaPaymentContainer(context, data, index, isChecked, accountType),
            ),
          );
        } else if (accountType == AccountType.debit) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: () {
                context.read<AccountsController>().pickbilling(index);
              },
              child: _buildDebitPaymentContainer(context, data, index, isChecked, accountType),
            ),
          );
        }

        return const SizedBox.shrink(); // Return an empty widget for other account types
      },
      itemCount: data.length,
    );
  }

  Widget _buildMpesaPaymentContainer(BuildContext context, List<dynamic> data, int index, bool isChecked, AccountType accountType) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: isChecked
          ? type != null
          ? 200
          : 150
          : null,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: isChecked ? StyleColors.lukhuBlue10 : StyleColors.lukhuWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: StyleColors.lukhuDividerColor),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: StyleColors.lukhuDividerColor),
                ),
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  AppUtil.getPayIcon(accountType),
                  package: GlobalAppUtil.productListingPackageName,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                data[index]['account'],
                style: TextStyle(
                  color: StyleColors.lukhuDark1,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: StyleColors.lukhuDividerColor),
                ),
                child: CircularCheckbox(isChecked: isChecked),
              ),
            ],
          ),
          if (isChecked)
            Expanded(
              child: ListView.builder(
                itemBuilder: (_, positionIndex) {
                  var account = context
                      .read<AccountsController>()
                      .dataModel(
                    positionIndex,
                    context.watch<AccountsController>().getUserAccountsByType(accountType),
                  )!;
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: InkWell(
                      onTap: () {
                        context
                            .read<AccountsController>()
                            .toggleSelectedMethod(account.id!);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: StyleColors.lukhuWhite,
                          border: Border.all(color: StyleColors.lukhuDividerColor),
                        ),
                        child: Row(
                          children: [
                            Text("Ending with ${AppUtil.pickLast4Characters(account.account ?? '')}"),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: StyleColors.lukhuDividerColor),
                              ),
                              child: CircularCheckbox(
                                isChecked: context
                                    .watch<AccountsController>()
                                    .isPaymodelSelected(account.id ?? ""),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: context
                    .watch<AccountsController>()
                    .getUserAccountsByType(accountType)
                    .keys
                    .length,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDebitPaymentContainer(
      BuildContext context,
      List<dynamic> data,
      int index,
      bool isChecked,
      AccountType accountType) {
    final accountId = data[index]['id'] as String?;
    final account = data[index]['account'] as String?;

    // Schedule the state update after the build phase
    Future.microtask(() {
      context.read<AccountsController>().toggleChecked(isChecked);
    });

    return InkWell(
      onTap: accountId != null ? () {
        context.read<AccountsController>().toggleSelectedMethod(accountId);
      } : null,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: isChecked
            ? accountType != null
            ? 70
            : 100
            : null,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: isChecked ? StyleColors.lukhuBlue10 : StyleColors.lukhuWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: StyleColors.lukhuDividerColor),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: StyleColors.lukhuDividerColor),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    AppUtil.getPayIcon(accountType),
                    package: GlobalAppUtil.productListingPackageName,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  account ?? 'Unknown Account',  // Provide a fallback for null account
                  style: TextStyle(
                    color: StyleColors.lukhuDark1,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: StyleColors.lukhuDividerColor),
                  ),
                  child: CircularCheckbox(isChecked: isChecked),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}
