import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppLayout {
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static getScreenHeight() {
    return Get.height;
  }

  static getScreenWidth() {
    return Get.width;
  }

  static getHeight(double pixels) {
    double x = getScreenHeight() / pixels;
    return getScreenHeight() / x;
  }

  static getWidth(double pixels) {
    double x = getScreenWidth() / pixels;
    return getScreenWidth() / x;
  }

  final blockSizeHorizontal = getScreenWidth() / 100;
  final blockSizeVertical = getScreenHeight() / 100;
}

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, double value) {
    // 720 is medium screen height
    print(AppLayout.getScreenHeight());
    return (value /
        AppLayout.getScreenHeight() *
        MediaQuery.of(context).size.height);
  }
}
