import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        DateFormat,
        NumberFormat,
        StatusCard,
        StyleColors,
        Transaction,
        WatchContext;
import 'package:lukhu_pay/src/widgets/wallet/wallet_text.dart';
import 'package:lukhu_pay/util/app_util.dart';
import 'package:lukhu_pay/src/controller/transaction_controller.dart';

import 'transaction_image.dart';
import '../../services/transactions/transaction_service.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: TransactionService().fetchTransactions(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No transactions found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return TransactionCard(transaction: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key, this.show = false, this.onTap, required this.transaction});
  final bool show;
  final void Function()? onTap;
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var statusType = transaction.metadata ?? {};
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          width: size.width,
          child: Row(
            children: [
              SizedBox(
                height: 32,
                width: 32,
                child: TransactionImage(
                  transaction: transaction,
                  padding: 0,
                ),
              ),
              const SizedBox(width: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    transaction.description ?? '',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.scrim,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    transaction.createdAt ?? '',
                    style: TextStyle(
                      color: StyleColors.lukhuGrey50,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              if (statusType['type'] != null)
                StatusCard(
                  type: AppUtil.statusType(statusType),
                ),
              const SizedBox(width: 8),
              WalletText(
                description: '${AppUtil.transactionOperator(AppUtil.transactionType(statusType))} ${NumberFormat.currency(
                  locale: 'en_US',
                  symbol: 'KES ',
                ).format(transaction.amount ?? 0)}',
                style: TextStyle(
                  color: AppUtil.transactionTypeColor(statusType, transaction).last, // textColor(statusType),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                show: context.watch<TransactionController>().showTransactions,
              ),
              const SizedBox(
                width: 4,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.scrim,
                size: 14,
              )
            ],
          ),
        ),
      ),
    );
  }
}