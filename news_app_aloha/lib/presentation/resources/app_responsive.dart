import 'package:flutter/cupertino.dart';

extension DoubleExt on double {
  double h() => AppResponsive.getHeight(this); //h refer to Height
  double w() => AppResponsive.getWidth(this); //w refer to width
  double s() => AppResponsive.getSize(this); //s refer to size
}

extension IntegerExt on int {
  double h() => AppResponsive.getHeight(toDouble()); //h refer to Height
  double w() => AppResponsive.getWidth(toDouble()); //w refer to width
  double s() => AppResponsive.getSize(toDouble()); //s refer to size
}

class AppResponsive {
  static const double appHeightXD = 926;
  static const double appWidthXD = 428;
  static BuildContext? context;

  static double get currentHeight => MediaQuery.of(context!).size.height;
  static double get currentWidth => MediaQuery.of(context!).size.width;
  static double get ratio => MediaQuery.of(context!).size.aspectRatio;
  static double get currentSize => currentHeight * currentWidth;
  static double get appSizePort => appHeightXD * appWidthXD;

  static double getSize(double size) {
    var responsiveSize = (size / appWidthXD) * currentWidth;
    var lowerLimit = size * 0.5;
    var upperLimit = size * 2.5;
    return responsiveSize.clamp(lowerLimit, upperLimit);
  }

  static double getHeight(double height) {
    return (height / appHeightXD) * currentHeight;
  }

  static double getWidth(double width) {
    return (width / appWidthXD) * currentWidth;
  }
}
