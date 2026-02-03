import 'package:auth_plugin/src/utils/app_util.dart';
import 'package:flutter/material.dart';

import 'gift_text.dart';

class GiftTile extends StatelessWidget {
  const GiftTile({super.key, required this.data, this.onTap});
  final Map<String, dynamic> data;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SizedBox(
              height: 100,
              width: size.width,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(4)),
                child: Image.asset(
                  data['image'],
                  package: AppUtil.packageName,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          GiftText(
            title: 'Value: ',
            description: 'KSh ${data['value']}',
          ),
          GiftText(
            title: 'Price: ',
            description: 'KSh ${data['price']}',
          ),
        ],
      ),
    );
  }
}
