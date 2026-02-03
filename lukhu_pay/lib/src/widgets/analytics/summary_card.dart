import 'package:flutter/material.dart';
import 'package:lukhu_pay/util/app_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        CustomColors,
        GlassmorphicContainer,
        NumberFormat,
        ReadContext,
        WatchContext,
        UserRepository;

class SummaryCard extends StatefulWidget {
  const SummaryCard({
    super.key,
    required this.userId,
    required this.name,
    required this.image,
    required this.color,
    required this.description,
  });

  final String userId;
  final String name;
  final String image;
  final Color color;
  final String description;

  @override
  _SummaryCardState createState() => _SummaryCardState();
}

class _SummaryCardState extends State<SummaryCard> {
  double _availableBalance = 0;
  double _pendingBalance = 0;

  @override
  void initState() {
    super.initState();
    _fetchBalance();
  }

  Future<void> _fetchBalance() async {
    // Access Firestore instance
    final userId = context.read<UserRepository>().fbUser?.uid;
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
    return Container(
      decoration: BoxDecoration(
        color: widget.color, // Access data using widget.data
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.only(
        left: 12,
        top: 14,
        right: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.name, // Access data using widget.data
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                ),
              ),
              Image.asset(
                widget.image, // Access data using widget.data
                package: AppUtil.packageName,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.description, // Access data using widget.data
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
