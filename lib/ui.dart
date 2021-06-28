import 'dart:ui' show window;
export 'package:flutter/material.dart';
import 'package:flutter/material.dart';

export 'package:sparrow_utils/sparrow_utils.dart';

/// 物理屏幕，物理像素，它的size可以通过[window.physicalSize]获得，比如iPhone11 Pro的宽高是1125 * 2436
/// 逻辑屏幕，逻辑像素，
/// 设备像素比devicePixelRatio，通过[window.devicePixelRatio]获得
/// 自定义屏幕适配器，我们自定义的屏幕，

Color rgba(int red, int green, int blue, double opacity) {
  return Color.fromRGBO(red, green, blue, opacity);
}
