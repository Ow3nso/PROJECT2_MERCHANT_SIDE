import 'package:flutter/material.dart';

import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultButton, StyleColors;

class AttatchmentsSelectionCard extends StatelessWidget {
  const AttatchmentsSelectionCard(
      {super.key,
      required this.handleImageSelection,
      required this.handleFileSelection});
  final void Function() handleImageSelection;
  final void Function() handleFileSelection;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double w = size.width * .75;
    return Material(
        color: StyleColors.lukhuWhite,
        borderRadius: BorderRadius.circular(12),
        elevation: 1,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 20),
          child: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DefaultButton(
                  onTap: () {
                    Navigator.of(context).pop();
                    handleImageSelection();
                  },
                  color: StyleColors.lukhuBlue,
                  //actionDissabledColor: StyleColors.lukhuDisabledButtonColor,
                  label: 'Photo',
                  height: 40,
                  width: w,
                  style: TextStyle(
                      color: StyleColors.lukhuWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                const SizedBox(height: 16),
                DefaultButton(
                  onTap: () {
                    Navigator.of(context).pop();
                    handleFileSelection();
                  },
                  color: StyleColors.lukhuBlue,
                  //actionDissabledColor: StyleColors.lukhuDisabledButtonColor,
                  label: 'File',
                  height: 40,
                  width: w,
                  style: TextStyle(
                      color: StyleColors.lukhuWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                const SizedBox(height: 16),
                DefaultButton(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  label: 'Cancel',
                  color: StyleColors.lukhuWhite,
                  height: 40,
                  width: w,
                  boarderColor: StyleColors.lukhuDividerColor,
                  textColor: StyleColors.lukhuDark1,
                ),
              ],
            ),
          ),
        ));
  }
}
