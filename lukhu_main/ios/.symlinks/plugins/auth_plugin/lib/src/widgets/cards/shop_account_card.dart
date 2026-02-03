import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:flutter/material.dart';

import '../buttons/default_auth_btn.dart';

class ShopAccountCard extends StatelessWidget {
  const ShopAccountCard({super.key, required this.data,this.following = false,required this.onTap});
  final Map<String, dynamic> data;
  final bool following;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(data['image']!),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['businessName']!,
                  style: TextStyle(
                      color: AuthConstants.textDarkColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    data['location']!,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AuthConstants.subtitleFadeGray),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          AuthButton(
            color:following?AuthConstants.buttonBlueDissabled : AuthConstants.buttonBlue,
            label:following?'Unfollow': 'Follow',
            width: 125,
            height: 36,
            textColor: following? AuthConstants.buttonBlue:Colors.white,
            
            actionDissabledColor: AuthConstants.buttonBlueDissabled,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
