import 'package:auth_plugin/src/controllers/gift/gifts_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultInputField, DefaultPrefix, WatchContext;

class GiftDetail extends StatelessWidget {
  const GiftDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<GiftsController>();
    return Form(
      key: controller.payCardFormKey,
      child: ListView(
        padding: const EdgeInsets.only(right: 16, left: 16),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: DefaultInputField(
              controller: controller.recipientNameController,
              onChange: (value) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Recipient name cannot be empty';
                }
                return null;
              },
              keyboardType: TextInputType.name,
              label: 'To',
              hintText: 'Enter recipients name',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: DefaultInputField(
              controller: controller.recipientEmailController,
              onChange: (value) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Recipient email cannot be empty';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              hintText: 'Enter recipients email address',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: DefaultInputField(
              controller: controller.recipientPhoneController,
              onChange: (value) {},
              textInputFormatter: [
                LengthLimitingTextInputFormatter(10),
              ],
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Recipient name cannot be empty';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              hintText: '0712 345 678',
              prefix: const DefaultPrefix(text: '+254'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: DefaultInputField(
              controller: controller.yourNameController,
              onChange: (value) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Name cannot be empty';
                }
                return null;
              },
              keyboardType: TextInputType.name,
              label: 'From',
              hintText: 'Enter your name',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: DefaultInputField(
              controller: controller.yourNoteController,
              onChange: (value) {},
              maxLines: 3,
              keyboardType: TextInputType.name,
              hintText: 'Write a note',
            ),
          )
        ],
      ),
    );
  }
}
