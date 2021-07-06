import 'package:sparrow_ui/sparrow_ui.dart';

/// 按钮样式
@immutable
class SPButtonStyle {
  /// 按钮类型
  final SPButtonType buttonType;

  /// 按钮大小
  final SPButtonSize buttonSize;

  /// 按钮圆角大小
  final SPRadius buttonRadius;

  /// 颜色场景
  final SPColorSense colorSense;

  /// 按钮状态
  final SPButtonStatus buttonStatus;

  /// 构造函数
  const SPButtonStyle({
    this.buttonType = SPButtonType.primary,
    this.buttonRadius = SPRadius.small,
    this.buttonSize = SPButtonSize.big,
    this.colorSense = SPColorSense.primary,
    this.buttonStatus = SPButtonStatus.normal,
  });

  ///
  SPButtonStyle copyWith({
    /// 按钮类型
    SPButtonType? buttonType,

    /// 按钮大小
    SPButtonSize? buttonSize,

    /// 按钮圆角大小
    SPRadius? buttonRadius,

    /// 颜色场景
    SPColorSense? colorSense,

    /// 按钮状态
    SPButtonStatus? buttonStatus,
  }) {
    return SPButtonStyle(
      buttonRadius: buttonRadius ?? this.buttonRadius,
      colorSense: colorSense ?? this.colorSense,
      buttonSize: buttonSize ?? this.buttonSize,
      buttonType: buttonType ?? this.buttonType,
      buttonStatus: buttonStatus ?? this.buttonStatus,
    );
  }
}

/// 按钮类型
enum SPButtonType {
  /// 主按钮，颜色填充，白色文字
  primary,

  /// 次按钮：外描边，浅色填充，颜色文字
  secondary,
}

/// 按钮大小
enum SPButtonSize {
  big,
  small,
}

/// 按钮状态：正常、暂未激活、禁用
enum SPButtonStatus {
  /// 正常
  normal,

  /// 暂未激活
  inactive,

  ///禁用
  disabled,
}
