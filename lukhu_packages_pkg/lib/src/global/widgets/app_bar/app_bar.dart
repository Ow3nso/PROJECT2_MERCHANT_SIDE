import 'package:flutter/material.dart';
import 'package:product_listing_pkg/product_listing_pkg.dart'
    show CartIcon, NotificationIcon;

import '../../../utils/enums.dart';
import '../cards/prefferedsize_widget.dart';
import '../lukhu_logo.dart';

class LuhkuAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LuhkuAppBar(
      {super.key,
      this.height = 0,
      this.appBarType = AppBarType.navigation,
      this.actions,
      this.title,
      this.bottom,
      this.centerTitle = false,
      this.backAction,
      this.color,
      this.enableShadow = false,
      this.bottomHeight = 0,
      this.automaticallyImplyLeading = false
      });

  /// A variable that is used to set the height of the app bar.
  final double height;

  final AppBarType appBarType;

  final Widget? title;

  final List<Widget>? actions;

  final Widget? bottom;

  final Widget? backAction;
  final bool centerTitle;
  final Color? color;
  /// @deprecated
  final bool enableShadow;

  /// A variable that is used to set the height of the bottom widget.
  final double bottomHeight;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      automaticallyImplyLeading: automaticallyImplyLeading ,
      leading: appBarType != AppBarType.other?  const NotificationIcon(): backAction,
      centerTitle: appBarType != AppBarType.other? true: centerTitle,
      title: appBarType != AppBarType.other? const LuhkuMainLogo()  :Row(children: [
        if(title != null) title!,
      ],),
      actions: [
        if (appBarType != AppBarType.other) const CartIcon(),
        ...actions ?? [],
      ],
     bottom: bottom != null? CustomPreferredSizeWidget(height: height > 0 ? (height - kToolbarHeight): bottomHeight,child: Column(
      children: [bottom!],
     ),):null ,
    );
  }


  @override

   Size get preferredSize => height > 0 ? Size.fromHeight(height) :
      const Size.fromHeight(kToolbarHeight) + Offset(0, bottomHeight);
}
