import 'package:flutter/material.dart';

import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        BlurDialogBody,
        DefaultMessage,
        DefaultTextBtn,
        HourGlass,
        NavigationService,
        ReadContext,
        StyleColors,
        Transaction,
        WatchContext;

import 'package:lukhu_pay/src/controller/transaction_controller.dart';
import 'package:lukhu_pay/src/pages/index.dart';
import 'package:lukhu_pay/src/widgets/transactions/transaction_card.dart';
import 'package:lukhu_pay/src/widgets/transactions/transaction_detail.dart';

import '../../services/transactions/transaction_service.dart';

class TransactionsContainer extends StatelessWidget {
  const TransactionsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 10),
          if (context
              .watch<TransactionController>()
              .shopTransaction
              .keys
              .isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transactions',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.scrim,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                DefaultTextBtn(
                  label: 'View All',
                  onTap: () {
                    NavigationService.navigate(
                      context,
                      TransactionsPage.routeName,
                    );
                  },
                )
              ],
            ),
          FutureBuilder(
            future: TransactionService().fetchTransactions(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (context
                    .watch<TransactionController>()
                    .shopTransaction
                    .keys
                    .isEmpty) {
                  return DefaultMessage(
                    title: 'You don\'t have any transactions at the moment',
                    description: '${snapshot.error ?? ''}',
                    label: 'Refresh',
                    onTap: () {
                      TransactionService().fetchTransactions(context);
                    },
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: context
                      .watch<TransactionController>()
                      .shopTransaction
                      .keys
                      .length,
                  itemBuilder: (context, index) {
                    var valueTransaction = transaction(
                        index,
                        context
                            .watch<TransactionController>()
                            .shopTransaction);
                    return TransactionCard(
                      show: true,
                      transaction: valueTransaction!,
                      onTap: () {
                        _showTransactionDetail(context, valueTransaction);
                      },
                    );
                  },
                  separatorBuilder: (context, index) =>
                      Divider(color: StyleColors.lukhuGrey10),
                );
              } else if (snapshot.hasError) {
                return DefaultMessage(
                  title: 'An error occurred.',
                  description: '${snapshot.error ?? ''}',
                  label: 'Refresh',
                  onTap: () {
                    context.read<TransactionController>().getTransactions(isRefreshMode: true);
                  },
                );
              }
              return const Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: HourGlass(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Transaction? transaction(int index, Map<String, Transaction> value) {
    return value[_transactionKey(index, value)];
  }

  String _transactionKey(int index, Map<String, Transaction> value) {
    return value.keys.elementAt(index);
  }

  void _showTransactionDetail(BuildContext context, Transaction transaction) {
    showDialog(
      context: context,
      builder: (ctx) => BlurDialogBody(
        child: TransactionDetail(
          transactions: transaction,
        ),
      ),
    );
  }
} 
