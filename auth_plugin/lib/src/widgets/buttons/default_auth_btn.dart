import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key,
      this.asssetIcon,
      this.color,
      this.label,
      this.textColor = Colors.white,
      this.actionDissabledColor,
      this.boarderColor,
      this.onTap,
      this.width,
      this.height,this.loading =false});
  final String? label;
  final String? asssetIcon;
  final Color? color;
  final Color? textColor;
  final Color? actionDissabledColor;
  final Color? boarderColor;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return loading? const Center(child: CircularProgressIndicator()) :Container(
      width: width ?? size.width,
      height: height ?? 50,
      decoration: BoxDecoration(
          color: onTap == null ? actionDissabledColor : color,
          borderRadius: BorderRadius.circular(8),
          border: boarderColor != null
              ? Border.all(color: boarderColor!, width: 2)
              : null),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (asssetIcon != null)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  asssetIcon!,
                  package: AuthConstants.pluginName,
                ),
              ),
            if (label != null)
              Text(
                label!,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              )
          ],
        ),
      ),
    );
  }
}
