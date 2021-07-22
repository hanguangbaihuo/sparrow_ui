import 'package:sparrow_ui/sparrow_ui.dart';

/// 按钮样式
@immutable
class PIButtonStyle {
  /// 按钮类型
  final PIButtonType buttonType;

  /// 按钮大小
  final PIButtonSize buttonSize;

  /// 按钮圆角大小
  final PIRadius buttonRadius;

  /// 颜色场景
  final PIColorSense colorSense;

  /// 按钮状态
  final PIButtonStatus buttonStatus;

  /// 构造函数
  const PIButtonStyle({
    this.buttonType = PIButtonType.primary,
    this.buttonRadius = PIRadius.small,
    this.buttonSize = PIButtonSize.big,
    this.colorSense = PIColorSense.primary,
    this.buttonStatus = PIButtonStatus.normal,
  });

  ///
  PIButtonStyle copyWith({
    /// 按钮类型
    PIButtonType? buttonType,

    /// 按钮大小
    PIButtonSize? buttonSize,

    /// 按钮圆角大小
    PIRadius? buttonRadius,

    /// 颜色场景
    PIColorSense? colorSense,

    /// 按钮状态
    PIButtonStatus? buttonStatus,
  }) {
    return PIButtonStyle(
      buttonRadius: buttonRadius ?? this.buttonRadius,
      colorSense: colorSense ?? this.colorSense,
      buttonSize: buttonSize ?? this.buttonSize,
      buttonType: buttonType ?? this.buttonType,
      buttonStatus: buttonStatus ?? this.buttonStatus,
    );
  }
}

/// 按钮类型
enum PIButtonType {
  /// 主按钮，颜色填充，白色文字
  primary,

  /// 次按钮：外描边，浅色填充，颜色文字
  secondary,
}

/// 按钮大小
enum PIButtonSize {
  big,
  small,
}

/// 按钮状态：正常、暂未激活、禁用
enum PIButtonStatus {
  /// 正常
  normal,

  /// 暂未激活
  inactive,

  ///禁用
  disabled,
}
