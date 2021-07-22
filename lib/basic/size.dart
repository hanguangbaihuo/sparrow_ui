import 'package:sparrow_ui/sparrow_ui.dart';

class PISize {
  /// 小圆角
  static double radiusSmall = 4.rpx;
  static double radiusBig = 8.rpx;
}

/// 圆角大小
enum PIRadius {
  /// 全圆角
  full,

  /// 大圆角
  big,

  /// 小圆角
  small,
}

class PIRadiusSize {
  static double get small => 8.rpx;

  static double get big => 16.rpx;

  static double get mini => 4.rpx;
}

class PIRadius2 {
  static BorderRadius get small => BorderRadius.circular(PIRadiusSize.small);

  static BorderRadius get big => BorderRadius.circular(PIRadiusSize.big);

  static BorderRadius get mini => BorderRadius.circular(PIRadiusSize.mini);
}
