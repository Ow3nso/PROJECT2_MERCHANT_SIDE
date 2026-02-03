import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        DefaultBackButton,
        DefaultIconBtn,
        GlobalAppUtil,
        LuhkuAppBar,
        ReadContext,
        WatchContext,
        UserRepository,
        ReadContext;
import 'package:lukhu_pay/src/controller/analytics_controller.dart';
import 'package:lukhu_pay/src/widgets/analytics/summary_card.dart';
import 'package:lukhu_pay/util/app_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../widgets/analytics/graph_container.dart';
import '../widgets/analytics/firestore_service.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});
  static const routeName = 'analytics';

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  double _availableBalance = 0;
  double _pendingBalance = 0;
  double _totalTopups = 0;
  double _totalWithdrawals = 0;

  @override
  void initState() {
    super.initState();
    _fetchBalance();
    _fetchTransactionData();
  }

  Future<void> _fetchBalance() async {
    final userId = context
        .read<UserRepository>()
        .fbUser
        ?.uid;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await firestore
        .collection('wallet')
        .where('userId', isEqualTo: userId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      var walletData = querySnapshot.docs.first.data() as Map<String, dynamic>;

      setState(() {
        _availableBalance = walletData['availableBalance']?.toDouble() ?? 0;
        _pendingBalance = walletData['pendingBalance']?.toDouble() ?? 0;
      });
    }
  }

  Future<void> _fetchTransactionData() async {
    try {
      // Fetch data for a specific period, e.g., "last_30_days"
      Map<String, dynamic> incomeOverview = 
          await FirestoreService.fetchIncomeOverview(context, "last_30_days");
      
      setState(() {
        _totalTopups = incomeOverview['totalTopups']?.toDouble() ?? 0;
        _totalWithdrawals = incomeOverview['totalWithdrawals']?.toDouble() ?? 0;
      });
    } catch (e) {
      print('Error fetching transaction data: $e');
    }
  }

  final fireStore = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final userId = context
        .read<UserRepository>()
        .fbUser
        ?.uid;

    var size = MediaQuery.of(context).size;
    var summary = context.read<AnalyticsController>().summaryList;
    return Scaffold(
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        backAction: const DefaultBackButton(),
        centerTitle: true,
        title: Text(
          'Analytics',
          style: TextStyle(
            color: Theme.of(context).colorScheme.scrim,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: DefaultIconBtn(
              assetImage: AppUtil.callIcon,
              packageName: GlobalAppUtil.productListingPackageName,
            ),
          )
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            const GraphContainer(),
            const SizedBox(height: 24),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: SizedBox(
                height: 400,
                width: size.width,
                child: GridView.builder(
                  itemCount: summary.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.9,
                    crossAxisSpacing: 9,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 75,
                  ),
                  itemBuilder: (context, index) {
                    // Define different items based on index
                    List<Map<String, dynamic>> items = [
                      {
                        'name': 'Available Balance',
                        'image': 'assets/images/tick_circle.png',
                        'color': const Color(0xff2F9803),
                        'description': 'KSH $_availableBalance',
                      },
                      {
                        'name': 'Pending Balance',
                        'image': 'assets/images/clock.png',
                        'color': const Color(0xffF59E0B),
                        'description': 'KSH $_pendingBalance',
                      },
                      {
                        'name': 'Top Ups',
                        'image': 'assets/images/send_square_white.png',
                        'color': const Color(0xff1E40AF),
                        'description': 'KSH $_totalTopups',
                      },
                      {
                        'name': 'Withdrawals',
                        'image': 'assets/images/receive_square_white.png',
                        'color': const Color(0xffB91C1C),
                        'description': 'KSH $_totalWithdrawals',
                      },
                    ];

                    // Use index % items.length to cycle through items
                    final item = items[index % items.length];

                    return SummaryCard(
                      userId: userId ?? '',
                      name: item['name'],
                      image: item['image'],
                      color: item['color'],
                      description: item['description'],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
