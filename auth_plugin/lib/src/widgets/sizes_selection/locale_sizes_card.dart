import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:flutter/material.dart';

class LocaleSizesCard extends StatelessWidget {
  const LocaleSizesCard(
      {Key? key, required this.onLocaleChange, required this.selectedLocale})
      : super(key: key);
  final void Function(String) onLocaleChange;
  final String selectedLocale;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Row(
        children: [
          ...List.generate(
              _localeCount,
              (i) => LocaleCard(
                  borderRadius: _firstItem(i) || _lastItem(i)
                      ? BorderRadius.only(
                          topLeft: Radius.circular(_firstItem(i) ? 7 : 0),
                          bottomLeft: Radius.circular(_firstItem(i) ? 7 : 0),
                          topRight: Radius.circular(_lastItem(i) ? 7 : 0),
                          bottomRight: Radius.circular(_lastItem(i) ? 7 : 0))
                      : null,
                  onLocaleChange: onLocaleChange,
                  active: AuthConstants.sizesLocales[i] == selectedLocale,
                  locale: AuthConstants.sizesLocales[i]))
        ],
      ),
    );
  }

  bool _lastItem(int i) => i == (_localeCount - 1);

  bool _firstItem(int i) => i == 0;

  int get _localeCount => AuthConstants.sizesLocales.length;
}

class LocaleCard extends StatelessWidget {
  const LocaleCard(
      {super.key,
      required this.onLocaleChange,
      required this.locale,
      this.active = false,
      this.borderRadius});
  final void Function(String) onLocaleChange;
  final String locale;
  final bool active;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      height: 40,
      decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: active
              ? AuthConstants.textDarkColor
              : AuthConstants.optionCardBackgroundBlue,
          border: Border.all(width: 0.5)),
      child: InkWell(
        onTap: () => onLocaleChange(locale),
        child: Center(
          child: Text(
            locale,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: active ? Colors.white : AuthConstants.textDarkColor),
          ),
        ),
      ),
    ));
  }
}
