import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        BlurDialogBody,
        ConfirmationCard,
        DefaultIconBtn,
        GlobalAppUtil,
        LocationModel,
        StyleColors;

import '../../utils/app_util.dart';

class AddressCard extends StatelessWidget {
  const AddressCard(
      {super.key, this.onTap, this.onDelete, required this.location});

  final void Function()? onTap;
  final void Function()? onDelete;
  final LocationModel location;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: StyleColors.lukhuDividerColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  child: Image.asset(
                    AppUtil.getImageType(location.locationType!),
                    package: GlobalAppUtil.productListingPackageName,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location.locationType ?? '',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.scrim,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      location.location ?? '',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.scrim,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.scrim,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text('Edit',
                        style: TextStyle(
                          color: StyleColors.lukhuBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ))
                  ],
                ),
              ),
              const Spacer(),
              DefaultIconBtn(
                backgroundColor: Colors.transparent,
                onTap: () {
                  show(context);
                },
                assetImage: AppUtil.trashIcon,
                packageName: GlobalAppUtil.productListingPackageName,
              ),
            ],
          ),
          //trailing: ,
        ),
      ),
    );
  }

  void show(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return BlurDialogBody(
            bottomDistance: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ConfirmationCard(
                title: 'Delete Address',
                height: 300,
                assetImage: AppUtil.alertIcon,
                packageName: GlobalAppUtil.productListingPackageName,
                color: StyleColors.lukhuError10,
                description:
                    'Are you sure you want to delete this delivery address from your account?',
                primaryLabel: 'Yes',
                secondaryLabel: 'Cancel',
                onPrimaryTap: () {
                  if (onDelete != null) {
                    onDelete!();
                  }

                  Navigator.of(context).pop(true);
                },
                primaryButtonColor: StyleColors.lukhuError,
                onSecondaryTap: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ),
          );
        });
  }
}
