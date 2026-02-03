import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show CameraDevice, ImagePicker, ImageSource, XFile;

class PostOutfitController extends ChangeNotifier {
  final List<String?> _pikcedPictures = [null, null, null, null];
  List<String?> get pickedPictures => _pikcedPictures;

  bool isImageMissing = false;

  void addPicture({required File file, required int index}) async {
    _pikcedPictures[index] = file.path;
    notifyListeners();
  }

  void removePicture(int index) async {
    _pikcedPictures[index] = null;
    notifyListeners();
  }

  Future<File?> pickVideoOrImage({
    bool allowCamera = false,
    bool letUserPickVideo = false,
    bool useCameraFront = false,
    Duration? duration,
  }) async {
    File? pickedImageOrVideo;
    XFile? pickedFile;
    if (letUserPickVideo) {
      pickedFile = await ImagePicker().pickVideo(
        source: allowCamera ? ImageSource.camera : ImageSource.gallery,
        preferredCameraDevice:
            useCameraFront ? CameraDevice.front : CameraDevice.rear,
        maxDuration: duration,
      );
    } else {
      pickedFile = await ImagePicker().pickImage(
        source: allowCamera ? ImageSource.camera : ImageSource.gallery,
        preferredCameraDevice:
            useCameraFront ? CameraDevice.front : CameraDevice.rear,
      );
    }

    if (pickedFile != null) {
      pickedImageOrVideo = File(pickedFile.path);
    }

    return pickedImageOrVideo;
  }
}
