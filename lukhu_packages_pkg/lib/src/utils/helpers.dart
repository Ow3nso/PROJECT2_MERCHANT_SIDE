// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart';

import 'enums.dart'; 

class Helpers {
  /// The function determines whether a given path is a cloud URL path or a local file path.
  ///
  /// Args:
  ///   path (String): A string representing a file path or a URL path.
  ///
  /// Returns:
  ///   a value of type `PathType`, which indicates whether the input `path` is a local file path or a
  /// cloud URL path, or if it is an invalid path.
  static PathType getPathType(String path) {
    Uri uri;

    try {
      uri = Uri.parse(path);
    } catch (e) {
      return PathType.invalid;
    }

    // If the URI has a scheme like 'http', 'https', 'ftp', etc., it's a cloud URL path
    if (uri.hasScheme) {
      return PathType.cloud;
    }

    // If the URI doesn't have a scheme, assume it's a local file path
    return PathType.local;
  }

  /// This function takes an image file path, crops and resizes the image to a recommended resolution,
  /// compresses it to JPEG format with a quality level that meets size requirements, and saves the
  /// processed image to a new file.
  ///
  /// Args:
  ///   imagePath (String): The file path of the image that needs to be processed.
  ///
  /// Returns:
  ///   A `Future<File>` object is being returned.
  static Future<File> createHeroImage(String imagePath) async {
    // Load the image from the file path.
    File imageFile = File(imagePath);
    final imageBytes = await imageFile.readAsBytes();
    Image image = decodeImage(imageBytes)!;

    // Calculate the aspect ratio for the recommended resolution.
    const double targetWidth = 1200.0;
    const double targetHeight = 627.0;
    double aspectRatio = targetWidth / targetHeight;

    // Crop the image while maintaining the aspect ratio.
    int cropWidth, cropHeight;

    if (image.width / image.height > aspectRatio) {
      cropHeight = image.height;
      cropWidth = (cropHeight * aspectRatio).toInt();
    } else {
      cropWidth = image.width;
      cropHeight = cropWidth ~/ aspectRatio;
    }

    int offsetX = (image.width - cropWidth) ~/ 2;
    int offsetY = (image.height - cropHeight) ~/ 2;

    Image croppedImage = copyCrop(image,
        x: offsetX, y: offsetY, width: cropWidth, height: cropHeight);

    // Resize the image to the recommended resolution.
    Image resizedImage = copyResize(croppedImage,
        width: targetWidth.toInt(), height: targetHeight.toInt());

    // Compress the image to JPEG format with a quality level that meets the size requirements.
    int quality = 85;
    List<int> compressedBytes;
    do {
      compressedBytes = encodeJpg(resizedImage, quality: quality);
      quality -= 5;
    } while (compressedBytes.length > 300 * 1024 && quality >= 5);

    // Save the processed image to a new file.
    String outputImagePath =
        imagePath.replaceFirst(RegExp(r'\.\w+$'), '_hero.jpg');
    File outputFile = File(outputImagePath);
    await outputFile.writeAsBytes(compressedBytes);

    return outputFile;
  }

  /// The function logs a message with the file name, line number, and current time in an artistic format
  /// if the app is in debug mode.
  ///
  /// Args:
  ///   message (Object): The message to be logged. It can be of any data type.
  ///
  /// Returns:
  ///   If `kDebugMode` is `false`, nothing is returned. If `kDebugMode` is `true`, the log output is
  /// printed in an artistic format.
  static debugLog(

      /// The message to be logged. It can be of any data type.
      Object message,
      {
      /// The color of the log output.
      LogColor color = LogColor.magenta}) {
    if (!kDebugMode) {
      return;
    }

    final trace = StackTrace.current;
    final traceString =
        trace.toString().split('\n')[1]; // Get the relevant stack trace line

    final regex =
        RegExp(r'(?<=#1\s).+?(?=\s\()'); // Extract file path and line number
    final match = regex.firstMatch(traceString);
    final filePathLine = match?.group(0) ?? 'unknown';

    final file = File.fromUri(Uri.file(
        filePathLine.split(':').first)); // Get file object from the path
    final fileName =
        file.path.split(Platform.pathSeparator).last; // Extract the file name

    final lineNumber = filePathLine.split(':').last;

    // Get the current date and time
    final currentTime = DateTime.now();

    // Format the time as hhmmss
    final logTime =
        'Today-> ${currentTime.hour.toString().padLeft(2, '0')} :${currentTime.minute.toString().padLeft(2, '0')} :${currentTime.second.toString().padLeft(2, '0')}';

    // Print the log output in an artistic format with the specified color
    print(colorize('--- Start of Log Entry ---', color));
    print(colorize('Log Time: $logTime', color));
    print(colorize('File: $fileName($lineNumber)', color));
    print(colorize('Message:', color));
    print(colorize('$message', color));
    print(colorize('--- End of Log Entry ---\n', color));
  }

  static String colorize(String text, LogColor color) {
    final colorCode = {
      LogColor.red: 31,
      LogColor.green: 32,
      LogColor.yellow: 33,
      LogColor.blue: 34,
      LogColor.magenta: 35,
      LogColor.cyan: 36,
      LogColor.white: 37,
    };

    return '\x1B[${colorCode[color]}m$text\x1B[0m';
  }
}
