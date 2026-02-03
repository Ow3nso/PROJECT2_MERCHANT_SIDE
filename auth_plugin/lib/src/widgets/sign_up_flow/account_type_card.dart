import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:flutter/material.dart';

class AccountTypeCard extends StatelessWidget {
  const AccountTypeCard(
      {super.key,
      required this.iconAsset,
      required this.label,
      this.selected = false,
      required this.onTap});
  final String iconAsset;
  final String label;
  final bool selected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        height: 72,
        decoration: BoxDecoration(
            color: selected ? AuthConstants.activeRed : Colors.white,
            borderRadius: BorderRadius.circular(8)),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      '$iconAsset.png',
                      package: AuthConstants.pluginName,
                    ),
                    if (selected)
                      Image.asset(
                        '${iconAsset}_active.png',
                        package: AuthConstants.pluginName,
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    label,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: selected
                            ? Colors.white
                            : AuthConstants.textDarkColor),
                  ),
                ),
                const Spacer(),
                Image.asset(
                  'assets/icons/tick_square.png',
                  package: AuthConstants.pluginName,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
