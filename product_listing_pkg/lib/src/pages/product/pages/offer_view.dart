import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        DefaultBackButton,
        DefaultMessage,
        DeliveryStatus,
        LuhkuAppBar,
        ReadContext,
        UserRepository,
        StyleColors,
        WatchContext;
import 'package:product_listing_pkg/src/controller/offer_controller.dart';
import 'package:product_listing_pkg/src/controller/product_controller.dart';
import '../widgets/offer_container.dart';

class OfferView extends StatelessWidget {
  const OfferView({super.key});
  static const routeName = 'offer_view';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productController = context.read<ProductController>();
    final offerController = context.read<OfferController>();

    return Scaffold(
      body: FutureBuilder<String?>(
        future: _getUserId(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('User ID not available'));
          }

          final userId = snapshot.data!;

          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: LuhkuAppBar(
                appBarType: AppBarType.other,
                backAction: const DefaultBackButton(),
                title: Text(
                  'Your Offers',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    color: StyleColors.lukhuDark1,
                  ),
                ),
                bottomHeight: kTextTabBarHeight,
                bottom: Column(
                  children: [
                    TabBar(
                      indicatorColor: StyleColors.lukhuDark,
                      labelColor: StyleColors.lukhuDark,
                      labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      unselectedLabelColor: StyleColors.lukhuDark,
                      unselectedLabelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      tabs: [
                        Tab(text: 'Active Offers'),
                        Tab(text: 'Past Offers'),
                      ],
                    ),
                  ],
                ),
              ),
              body: SizedBox(
                height: size.height,
                width: size.width,
                child: TabBarView(
                  children: [
                    _buildActiveOffersTab(context, userId),
                    _buildPastOffersTab(context, userId),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildActiveOffersTab(BuildContext context, String userId) {
    final offers = context.watch<OfferController>().similarOffers[userId] ?? {};
    
    if (offers.isEmpty) {
      return DefaultMessage(
        
        
        title: "You don't have active offers yet",
        description: 'Refresh by tapping the button below.',
        label: 'Refresh',
        onTap: () => _refresh(context, userId),
      );
    }

    return OfferContainer(
      type: DeliveryStatus.approved,
      future: context.read<OfferController>().getUserOffers(userId: userId),
      offers: offers,
      refresh: () => _refresh(context, userId),
      text: 'You have no active offers available.',
    );
  }

  Widget _buildPastOffersTab(BuildContext context, String userId) {
    final offers = context.watch<OfferController>().similarOffers[userId] ?? {};
    
    if (offers.isEmpty) {
      return DefaultMessage(
        
        
        title: "You don't have past offers yet",
        description: 'Refresh by tapping the button below.',
        label: 'Refresh',
        onTap: () => _refresh(context, userId),
      );
    }

    return OfferContainer(
      type: null,
      future: context.read<OfferController>().getUserOffers(userId: userId),
      offers: offers,
      refresh: () => _refresh(context, userId),
      text: 'You have no past offers available.',
    );
  }

  Future<String?> _getUserId(BuildContext context) async {
    try {
      return context.read<UserRepository>().fbUser?.uid;
    } catch (e) {
      debugPrint('Error getting user ID: $e');
      return null;
    }
  }

  Future<void> _refresh(BuildContext context, String userId) async {
    try {
      await context.read<OfferController>().getUserOffers(
            userId: userId,
            isRefreshMode: true,
            limit: 10,
          );
    } catch (e) {
      debugPrint('Error refreshing offers: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to refresh offers')),
      );
    }
  }
}
