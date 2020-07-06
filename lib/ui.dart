import 'dart:ui' show window;
export 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show Size;

import 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart' hide SizeExtension;

/// 物理屏幕，物理像素，它的size可以通过[window.physicalSize]获得，比如iPhone11 Pro的宽高是1125 * 2436
/// 逻辑屏幕，逻辑像素，
/// 设备像素比devicePixelRatio，通过[window.devicePixelRatio]获得
/// 自定义屏幕适配器，我们自定义的屏幕，

extension SizeExtension on num {
  num get rpx => ScreenUtil().setWidth(this);
}

Color rgba(int red, int green, int blue, double opacity) {
  return Color.fromRGBO(red, green, blue, opacity);
}

class SPUI {
  // 我们自己设定的虚拟屏幕宽度750
  static double _customScreenWidth = 750.0;

  /// ScreenUtil要求在首页进行初始化操作
  /// 设定宽度为750，计算相应高度
  /// 以iPhone11举例
  /// 物理像素 828 * 1792
  /// 逻辑像素 414 * 896
  /// 像素比 2
  ///
  /// 自定义逻辑像素 750 * 1623.19

  /// iPhone 8 plus
  /// 物理像素 1242 * 2208  为什么官网写的是1920*1080呢？
  /// 逻辑像素 414 * 736
  /// 像素比 3
  /// 自定义逻辑像素 750 * 1333.333
  static void init() {
    Size physicalSize = getPhysicalSize();
    ScreenUtil.init(
      width: SPUI._customScreenWidth,
      height:
          SPUI._customScreenWidth * physicalSize.height / physicalSize.width,
    );
  }

  static double getCustomSize(double defaultLength) {
    return defaultLength * SPUI.getAdapterRatioRatio();
  }

  /// 屏幕物理像素
  static Size getPhysicalSize() {
    return Size(window.physicalSize.width, window.physicalSize.height);
  }

  /// 自定义 逻辑像素 宽750
  static Size getAdapterSize() {
    return Size(
      _customScreenWidth,
      window.physicalSize.height / getAdapterRatio(),
    );
  }

  /// 默认 逻辑像素
  static Size getDefaultAdapterSize() {
    return Size(
      window.physicalSize.width / window.devicePixelRatio,
      window.physicalSize.height / window.devicePixelRatio,
    );
  }

  /// 屏幕适配器比例
  static double getAdapterRatio() {
    // 物理宽度/设定宽度
    return window.physicalSize.width / _customScreenWidth;
  }

  // 默认屏幕适配器比例 / 自定义屏幕适配器比例
  // 我们经常可以拿到默认的长度（比如status Bar的高度），乘以这个值可以得到我们想要的对应高度
  static double getAdapterRatioRatio() {
    return window.devicePixelRatio / getAdapterRatio();
  }

  /// 状态栏高度
  static double getStatusBarHeight() {
    return getCustomSize(ScreenUtil.statusBarHeight);
  }

  /// 底部栏高度
  static double getButtomBarHeight() {
    return getCustomSize(ScreenUtil.bottomBarHeight);
  }
}
