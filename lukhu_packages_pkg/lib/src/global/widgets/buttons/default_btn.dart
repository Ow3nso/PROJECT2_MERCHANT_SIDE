import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show SvgPicture;
import 'package:product_listing_pkg/utils/app_util.dart';

/// A button that can be used in the app.
class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {super.key,
      this.asssetIcon,
      this.color,
      this.label,
      this.textColor = Colors.white,
      this.actionDissabledColor,
      this.boarderColor,
      this.onTap,
      this.width,
      this.height,
      this.loading = false,
      this.borderSize,
      this.style,
      this.buttonRadius,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.buttonIconType = ButtonIconType.image,
      this.packageName});
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
  final double? borderSize;
  final TextStyle? style;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final ButtonIconType buttonIconType;
  final String? packageName;
  final double? buttonRadius;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return loading
        ? const Center(child: CircularProgressIndicator())
        : Container(
            width: width ?? size.width,
            height: height ?? 50,
            decoration: BoxDecoration(
                color: onTap == null ? actionDissabledColor : color,
                borderRadius:
                    BorderRadius.circular(buttonRadius ?? AppUtil.borderRadius),
                border: boarderColor != null
                    ? Border.all(color: boarderColor!, width: borderSize ?? 1)
                    : null),
            child: InkWell(
              onTap: onTap,
              child: Row(
                crossAxisAlignment: crossAxisAlignment,
                mainAxisAlignment: mainAxisAlignment,
                children: [
                  if (asssetIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 16),
                      child: buttonIcon(buttonIconType),
                    ),
                  if (label != null)
                    Text(
                      label!,
                      style: style ??
                          TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                    )
                ],
              ),
            ),
          );
  }

  Widget buttonIcon(ButtonIconType type) {
    switch (type) {
      case ButtonIconType.image:
        return Image.asset(
          asssetIcon!,
          package: packageName ?? AppUtil.packageName,
        );

      case ButtonIconType.svg:
        return SvgPicture.asset(
          asssetIcon!,
          package: packageName ?? AppUtil.packageName,
        );
    }
  }
}
