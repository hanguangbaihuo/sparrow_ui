import 'package:flutter/material.dart';
import 'package:sparrow_ui/sparrow_ui.dart';

class PIThemeData {
  /// 主色卡
  final MaterialColor primarySwatch;

  /// 次色卡
  final MaterialColor secondarySwatch;

  /// 颜色场景对应的色卡
  Map<PIColorSense, MaterialColor> cPIColorSense = {};

  late PIButtonStyle buttonStyle;

  PIThemeData({
    this.primarySwatch = PIColors.blue,
    this.secondarySwatch = PIColors.gold,
  }) {
    this.cPIColorSense = {
      PIColorSense.primary: primarySwatch,
      PIColorSense.info: PIColors.blue,
      PIColorSense.error: PIColors.red,
      PIColorSense.success: PIColors.green,
      PIColorSense.warning: PIColors.yello,
    };

    this.buttonStyle = PIButtonStyle();
  }
}
