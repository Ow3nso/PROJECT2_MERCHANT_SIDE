import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AddFileCard,
        AppBarType,
        Consumer,
        DefaultBackButton,
        DefaultButton,
        DefaultInputField,
        LuhkuAppBar,
        StyleColors,
        SvgPicture;

import '../../../../utils/app_util.dart';
import '../../../controller/post_outfit_controller.dart';

class PostOutfitView extends StatelessWidget {
  const PostOutfitView({super.key});
  static const routeName = 'post_out_fit_view';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        height: 85,
        enableShadow: true,
        color: Theme.of(context).colorScheme.onPrimary,
        backAction: const DefaultBackButton(),
        title: Text(
          'Post Outfit',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 24,
            color: StyleColors.lukhuDark1,
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              AppUtil.documentIcon,
              package: AppUtil.packageName,
              height: 32,
              width: 32,
            ),
            onPressed: () {},
          ),
          const SizedBox(
            width: 8,
          )
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView.builder(
          itemBuilder: (context, index) => _views[index],
          itemCount: _views.length,
        ),
      ),
    );
  }

  List<Widget> get _views => [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Add Images or Videos',
            style: TextStyle(
              color: StyleColors.lukhuDark,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 24,
          ),
          child:
              Consumer<PostOutfitController>(builder: (context, postOutFit, _) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                      List.generate(postOutFit.pickedPictures.length, (index) {
                    var path = postOutFit.pickedPictures[index];
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AddFileCard(
                          dottedBorderColor: StyleColors.lukhuDark1,
                          onRemoveFile: () {
                            postOutFit.removePicture(index);
                          },
                          onSelectFile: () {
                            postOutFit.pickVideoOrImage().then((image) {
                              if (image != null) {
                                postOutFit.addPicture(
                                    file: image, index: index);
                              }
                            });
                          },
                          showBadge: path != null,
                          mediaPath: path,
                          isVideo:
                              index == postOutFit.pickedPictures.length - 1,
                        ),
                      ),
                    );
                  }),
                ),
                if (postOutFit.isImageMissing)
                  const SizedBox(
                    height: 6,
                  ),
                if (postOutFit.isImageMissing)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Add at least 1 photo or video to post',
                        style: TextStyle(
                          color: StyleColors.lukhuRed,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DefaultInputField(
                    onChange: (value) {},
                    hintText: 'Describe your outfit...',
                    label: 'Add a description',
                    maxLines: 5,
                    labelStyle: TextStyle(
                      color: StyleColors.lukhuDark,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Tag Items',
                      style: TextStyle(
                        color: StyleColors.lukhuDark,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Container(
                    height: 64,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: StyleColors.lukhuTagColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: StyleColors.lukhuBlue,
                          child: Icon(
                            Icons.add,
                            size: 14,
                            color: StyleColors.lukhuWhite,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            'Tap to tag items that you are selling or show off outfits bought on Lukhu!',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: StyleColors.lukhuDark,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 133)
              ],
            );
          }),
        ),
        Container(
          height: 1,
          decoration: BoxDecoration(
              color: StyleColors.lukhuDividerColor,
              boxShadow: kElevationToShadow[4]),
          child: Row(children: [
            Expanded(
              child: Container(),
            )
          ]),
        ),
        const SizedBox(
          height: 27,
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
          ),
          child: Row(
            children: [
              Expanded(
                child: DefaultButton(
                  onTap: () {},
                  color: StyleColors.lukhuWhite,
                  label: 'Cancel',
                  height: 40,
                  width: 156,
                  boarderColor: StyleColors.lukhuDividerColor,
                  style: TextStyle(
                      color: StyleColors.lukhuDark1,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: DefaultButton(
                  onTap: null,
                  actionDissabledColor: StyleColors.lukhuDisabledButtonColor,
                  label: 'Post Outfit',
                  height: 40,
                  width: 180,
                  style: TextStyle(
                      color: StyleColors.lukhuWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
            ],
          ),
        )
      ];
}
