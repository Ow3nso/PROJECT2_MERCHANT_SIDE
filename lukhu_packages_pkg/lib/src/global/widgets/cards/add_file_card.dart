import 'dart:io';

import 'package:flutter/material.dart' hide Badge;
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        Badge,
        BadgePosition,
        BadgeStyle,
        BorderType,
        DottedBorder,
        StyleColors;

import '../../../utils/app_util.dart';
import '../../../utils/enums.dart';
import '../../../utils/helpers.dart';
import 'image_card.dart';

class AddFileCard extends StatelessWidget {
  const AddFileCard(
      {super.key,
      this.showBadge = false,
      this.mediaPath,
      this.isVideo = false,
      required this.onSelectFile,
      required this.onRemoveFile,
      this.dottedBorderColor});
  final bool showBadge;
  final String? mediaPath;
  final void Function() onSelectFile;
  final void Function() onRemoveFile;
  final bool isVideo;
  final Color? dottedBorderColor;

  @override
  Widget build(BuildContext context) {
    const imageSize = Size(84, 84);
    return Badge(
      badgeStyle: BadgeStyle(
        badgeColor: StyleColors.lukhuRed,
      ),
      position: BadgePosition.topEnd(
        top: -4,
        end: -2.5,
      ),
      badgeContent: Icon(
        Icons.close,
        color: StyleColors.lukhuWhite,
        size: 10,
      ),
      onTap: onRemoveFile,
      showBadge: showBadge,
      child: DottedBorder(
        strokeWidth: 1.5,
        color: dottedBorderColor ?? StyleColors.lukhuGrey10,
        borderType: BorderType.RRect,
        padding: EdgeInsets.all(mediaPath == null ? 27 : 0),
        radius: const Radius.circular(4),
        child: mediaPath != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Helpers.getPathType(mediaPath!) == PathType.cloud
                    ? ImageCard(image: mediaPath!, width: imageSize.width, height: imageSize.width,fit: BoxFit.cover,)
                    : Image.file(
                        File(mediaPath!),
                        fit: BoxFit.cover,
                        height: imageSize.height,
                        width: imageSize.width,
                      ),
              )
            : InkWell(
                onTap: onSelectFile,
                child: Image.asset(
                  isVideo ? AppUtil.iconVideo : AppUtil.galleryAddIcon,
                  height: 30,
                  width: 30,
                  package: AppUtil.packageName,
                ),
              ),
      ),
    );
  }
}
