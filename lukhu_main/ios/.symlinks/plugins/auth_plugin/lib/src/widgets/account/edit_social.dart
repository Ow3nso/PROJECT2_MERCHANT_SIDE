import 'package:auth_plugin/auth_plugin.dart';
import 'package:auth_plugin/src/controllers/auth/edit_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultInputField, ReadContext, StringExtension;

import '../../utils/app_util.dart';

class EditSocial extends StatefulWidget {
  const EditSocial(
      {super.key, this.index = 0, required this.image, this.color});
  final int index;
  final String image;
  final Color? color;

  @override
  State<EditSocial> createState() => _EditSocialState();
}

class _EditSocialState extends State<EditSocial> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setUri(widget.index);
    });
  }

  void _setUri(int index) {
    var shop = context.read<UserRepository>().shop;
    if (shop!.socialMedia == null) return;

    String? urlString;
    switch (index) {
      case 0:
        urlString = shop.socialMedia?.instagram;
        break;
      case 1:
        urlString = shop.socialMedia?.facebook;
        break;
      case 2:
        urlString = shop.socialMedia?.whatsapp;
        break;
      case 3:
        urlString = shop.socialMedia?.twitter;
        break;
    }

    if (urlString != null) {
      Uri uri = Uri.parse(urlString);
      setState(() {
        _controller.text = widget.index == 2
            ? uri.path.replaceAll('/', '').toPhone()
            : uri.path.replaceAll('/', '');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultInputField(
      controller: _controller,
      prefix: SizedBox(
        width: 80,
        height: 40,
        child: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Image.asset(
                  widget.image,
                  package: AppUtil.packageName,
                  color: context.read<EditAccountController>().isEditing
                      ? widget.color
                      : null,
                ),
              ),
              Expanded(child: Text(widget.index == 2 ? '254 |' : '@'))
            ],
          ),
        ),
      ),
      textInputFormatter: [
        if (widget.index == 2) LengthLimitingTextInputFormatter(10),
      ],
      keyboardType:
          widget.index == 2 ? TextInputType.phone : TextInputType.text,
      onChange: (value) {
        setState(() {});

        context.read<UserRepository>().updateSocial(
              link: (value ?? '').trim(),
              index: widget.index,
            );
        context.read<EditAccountController>().userIsReady =
            value != null && value.isNotEmpty;
      },
      validator: widget.index == 2 ? _validatePhone : _validateLink,
    );
  }

  String? _validatePhone(String? value) {
    if (value!.isEmpty) {
      return 'Field is required!.';
    }

    return null;
  }

  String? _validateLink(String? value) {
    if (value!.isEmpty) {
      return 'Field is required!.';
    }
    return null;
  }
}
