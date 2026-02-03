// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:ui';

import 'package:auth_plugin/auth_plugin.dart';
import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        ImagePicker,
        ImageSource,
        ImageUploadType,
        ReadContext,
        WatchContext,
        XFile;

import '../buttons/default_auth_btn.dart';

class AddProfilePhotoView extends StatefulWidget {
  const AddProfilePhotoView({
    super.key,
    this.label,
    this.title,
    this.description,
    this.onUpload,
    this.message,
    this.type = ImageUploadType.profile,
  });
  final String? label;
  final String? title;
  final String? description;
  final void Function(ImageUploadType)? onUpload;
  final String? message;
  final ImageUploadType type;

  @override
  State<AddProfilePhotoView> createState() => _AddProfilePhotoViewState();
}

class _AddProfilePhotoViewState extends State<AddProfilePhotoView> {
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Container(
                    width: 328,
                    height: 369,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.title ?? 'Set your profile picture',
                              style: TextStyle(
                                  color: AuthConstants.textDarkColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            widget.description ??
                                'Upload a profile picture that reps you!',
                            textAlign: TextAlign.center,
                            style: _grayStyle(),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 296,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: AuthConstants.boarderColor)),
                            child: InkWell(
                              onTap: _pickImage,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    context
                                                .watch<SignUpFlowController>()
                                                .profilePhotoUrl !=
                                            null
                                        ? CircleAvatar(
                                            backgroundColor:
                                                AuthConstants.tinyGray,
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                                context
                                                    .watch<
                                                        SignUpFlowController>()
                                                    .profilePhotoUrl!),
                                          )
                                        : context
                                                    .watch<
                                                        SignUpFlowController>()
                                                    .fileProfileImage ==
                                                null
                                            ? Image.asset(
                                                'assets/icons/photo_icon.png',
                                                package:
                                                    AuthConstants.pluginName,
                                              )
                                            : CircleAvatar(
                                                backgroundColor:
                                                    AuthConstants.tinyGray,
                                                radius: 30,
                                                backgroundImage: FileImage(context
                                                    .watch<
                                                        SignUpFlowController>()
                                                    .fileProfileImage!),
                                              ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Click to take a photo or upload',
                                        style: TextStyle(
                                            color: AuthConstants.textDarkColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Text(
                                      'SVG, PNG, JPG or GIF (max. 800x800px)',
                                      style: _grayStyle(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          AuthButton(
                            loading:
                                context.watch<SignUpFlowController>().loading,
                            width: 296,
                            color: AuthConstants.buttonBlue,
                            label: 'Confirm',
                            actionDissabledColor:
                                AuthConstants.buttonBlueDissabled,
                            onTap: context
                                        .watch<SignUpFlowController>()
                                        .fileProfileImage ==
                                    null
                                ? null
                                : () async {
                                    await _uploadImage(context);
                                  },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AuthButton(
                            width: 296,
                            color: Colors.white,
                            label: widget.label ?? 'Skip for now',
                            actionDissabledColor:
                                AuthConstants.buttonBlueDissabled,
                            textColor: const Color(0xff34303E),
                            boarderColor: AuthConstants.boarderColor,
                            onTap: () {
                              //Skip current option
                              context
                                  .read<SignUpFlowController>()
                                  .profilePhotoUrl = null;
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// The `_uploadImage` function uploads a profile image and displays a success or error message using
  /// a `SnackBar`.
  ///
  /// Args:
  ///   context (BuildContext): The BuildContext object represents the location of a widget in the
  /// widget tree. It is used to access various properties and methods related to the current widget and
  /// its surrounding widgets.
  ///
  /// Returns:
  ///   a `Future<void>`.
  Future<void> _uploadImage(BuildContext context) async {
    bool uploaded =
        await context.read<SignUpFlowController>().uploadProfileImage(
              type: widget.type,
            );
    if (uploaded) {
      context.read<UserRepository>().updateAndUpload(widget.type).then((value) {
        if (value) {
          context.read<SignUpFlowController>().profilePhotoUrl = null;
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text(widget.message ?? 'Profile photo uploaded, successfully')));

      Navigator.pop(context);
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'There was an error uploading your photo, please try again later')));
  }

  TextStyle _grayStyle() {
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AuthConstants.tinyGray);
  }

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 100,
      );
      if (pickedFile == null) return;
      context.read<SignUpFlowController>().fileProfileImage =
          File.fromUri(Uri.parse(pickedFile.path));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('We had trouble accessing your gallery')));
    }
  }
}
