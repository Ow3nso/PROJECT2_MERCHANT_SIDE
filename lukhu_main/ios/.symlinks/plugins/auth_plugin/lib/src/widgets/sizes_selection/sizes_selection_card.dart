import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:auth_plugin/src/controllers/auth/sign_up_flow.dart';
import 'package:auth_plugin/src/widgets/sizes_selection/locale_sizes_card.dart';
import 'package:auth_plugin/src/widgets/sizes_selection/size_card.dart';
import 'package:flutter/material.dart';

class SizedSelectionCard extends StatefulWidget {
  const SizedSelectionCard(
      {super.key,
      required this.category,
      required this.signUpFlowController,
      required this.title,
      required this.asseticon});
  final String title;
  final String category;
  final SignUpFlowController signUpFlowController;
  final String asseticon;

  @override
  State<SizedSelectionCard> createState() => _SizedSelectionCardState();
}

class _SizedSelectionCardState extends State<SizedSelectionCard> {
  String selectedLocale = '';
  @override
  void initState() {
    super.initState();
    selectedLocale = AuthConstants.sizesLocales[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        height: 300,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    widget.asseticon,
                    package: AuthConstants.pluginName,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          color: AuthConstants.textDarkColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              LocaleSizesCard(
                selectedLocale: selectedLocale,
                onLocaleChange: (locale) {
                  setState(() {
                    selectedLocale = locale;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 6,
                childAspectRatio: .999999,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: [
                  ...List.generate(
                      _sizes().length,
                      (i) => SizeCard(
                        selected: widget.signUpFlowController.isSizeSelected(category: widget.category, categoryTitle: widget.title, sizeLoCale: selectedLocale, size: _sizes()[i]),
                          onTap: (s) {
                            widget.signUpFlowController.updateSelectedSizes(
                                category: widget.category,
                                categoryTitle: widget.title,
                                sizeLoCale: selectedLocale,
                                size: s);
                          },
                          size: _sizes()[i]))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  List<String> _sizes() =>
      AuthConstants.localeSizes[widget.title]?[selectedLocale] ?? [];
}
