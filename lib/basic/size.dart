import 'package:sparrow_ui/sparrow_ui.dart';

/// 圆角大小
enum PIRadius {
  /// 全圆角
  full,

  /// 大圆角（卡片圆角）
  big,

  /// 小圆角（按钮、输入框的圆角）
  small,

  /// mini（小按钮、小tag用的圆角）
  mini,
}

class PIRadiusSize {
  static double get mini => 4.rpx;

  static double get small => 8.rpx;

  static double get big => 16.rpx;
}

class PIBorderRadius {
  static BorderRadius get small => BorderRadius.circular(PIRadiusSize.small);

  static BorderRadius get big => BorderRadius.circular(PIRadiusSize.big);

  static BorderRadius get mini => BorderRadius.circular(PIRadiusSize.mini);
}
