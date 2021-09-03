import 'package:sparrow_ui/sparrow_ui.dart';
import 'button_style.dart';
import 'base_button.dart';

class PIButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String content;
  final PIButtonStyle style;
  final IconData? icon;
  // final List<PIButtonStyle> styles;
  // 颜色：文字颜色、边框颜色、填充颜色

  PIButton({
    Key? key,
    required this.onPressed,
    required this.content,
    this.icon,
    this.style = const PIButtonStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = PITheme.of(context);

    // 注意此处，map取值的类型检查

    // 弃用旧的MaterialButton，改用新的ButtonStyleButton

    // 颜色组合：文字颜色、边框颜色、背景色

    return PIBaseButton(
      onPressed: onPressed,
      icon: icon,
      content: content,
      styles: [_renderStyle(theme)],
    );
  }

  /// 按钮样式
  ButtonStyle _renderStyle(PIThemeData theme) {
    final MaterialColor colorSwatch = theme.cPIColorSense[style.colorSense]!;

    return ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
        fontSize: _renderFontSize(),
        fontWeight: FontWeight.w500,
        height: SuiFonts.lineHeightContent,
      )),
      // 填充色、背景色
      backgroundColor: _renderBackgroundColor(colorSwatch),
      // 文字颜色、前景色
      foregroundColor: _renderTextColor(colorSwatch),
      overlayColor:
          MaterialStateProperty.all<Color>(Colors.black.withOpacity(0.1)),
      elevation: MaterialStateProperty.all<double>(0),
      fixedSize: MaterialStateProperty.all<Size>(
          Size.fromHeight(_renderButtonHeight())),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          // 圆角大小
          borderRadius: _renderRadius(),
          // 边框
          side: _renderBorder(colorSwatch),
        ),
      ),
      alignment: Alignment.center,
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(horizontal: 10.rpx)),
      // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  // 使用TextButton.styleFrom生成按钮样式，更简单一些
  // 使用主色设置文字颜色？！
  // 不过不能设置overlay颜色，overlay颜色是跟主色同步的
  // ButtonStyle _renderStyle2(PIThemeData theme) {
  //   final MaterialColor colorSwatch = theme.cPIColorSense[style.colorSense]!;

  //   return TextButton.styleFrom(
  //     textStyle: TextStyle(
  //       fontSize: _renderFontSize(),
  //       fontWeight: FontWeight.w500,
  //     ),
  //     // 填充色、背景色
  //     // 次按钮的文字颜色是色卡1
  //     backgroundColor: style.buttonType == PIButtonType.primary
  //         ? colorSwatch[6]!
  //         : colorSwatch[1]!,

  //     // 用primary才能设置文字颜色！！！
  //     primary: style.buttonType == PIButtonType.primary
  //         ? PIColors.white

  //         // 次按钮的文字颜色是色卡6
  //         : colorSwatch[6]!,
  //     elevation: 0,
  //     fixedSize: Size.fromHeight(_renderButtonHeight()),
  //     shape: RoundedRectangleBorder(
  //       // 圆角大小
  //       borderRadius: _renderRadius(),
  //       // 边框
  //       side: _renderBorder(colorSwatch),
  //     ),
  //     alignment: Alignment.center,
  //     padding: EdgeInsets.zero,
  //     // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  //   );
  // }

  /// 圆角
  BorderRadiusGeometry _renderRadius() {
    // 小圆角、大圆角
    if (style.buttonRadius == PIRadius.small) {
      return PIBorderRadius.small;
    } else if (style.buttonRadius == PIRadius.big) {
      return PIBorderRadius.big;
    }

    // 全圆角：需要根据按钮大小显示
    return BorderRadius.circular(_renderButtonHeight() / 2);
  }

  /// 边框
  BorderSide _renderBorder(MaterialColor colorSwatch) {
    // 主按钮没有边框
    if (style.buttonType == PIButtonType.primary) {
      return BorderSide.none;
    }

    Color borderColor = _renderSecondaryButtonColor(colorSwatch);

    // 次按钮
    return BorderSide(
      width: 1.rpx,
      color: borderColor,
    );
  }

  /// 填充色
  MaterialStateProperty<Color> _renderBackgroundColor(
      MaterialColor colorSwatch) {
    // 主按钮的填充颜色
    if (style.buttonType == PIButtonType.primary) {
      // 判断按钮状态
      // normal 6，inactive 3，disabled 2
      if (style.buttonStatus == PIButtonStatus.inactive) {
        return MaterialStateProperty.all<Color>(colorSwatch[3]!);
      } else if (style.buttonStatus == PIButtonStatus.disabled) {
        return MaterialStateProperty.all<Color>(PIColors.gray[3]!);
      }
      return MaterialStateProperty.all<Color>(colorSwatch[6]!);
    }

    // 次按钮的文字颜色是色卡1
    return MaterialStateProperty.all<Color>(colorSwatch[1]!);
  }

  /// 文字颜色
  MaterialStateProperty<Color> _renderTextColor(MaterialColor colorSwatch) {
    // 主按钮的文字颜色是白色
    if (style.buttonType == PIButtonType.primary) {
      return MaterialStateProperty.all<Color>(PIColors.white);
    }

    // 次级按钮颜色
    return MaterialStateProperty.all<Color>(
      _renderSecondaryButtonColor(colorSwatch),
    );
  }

  /// 次级按钮颜色
  ///
  /// 边框、文字颜色相同
  ///
  /// 次级按钮边框颜色和文字颜色相同
  Color _renderSecondaryButtonColor(MaterialColor colorSwatch) {
    if (style.buttonStatus == PIButtonStatus.inactive) {
      return colorSwatch[3]!;
    } else if (style.buttonStatus == PIButtonStatus.disabled) {
      return colorSwatch[2]!;
    }

    // 次按钮的边框颜色是色卡6
    return colorSwatch[6]!;
  }

  double _renderFontSize() {
    return style.buttonSize == PIButtonSize.big ? 34.rpx : 28.rpx;
  }

  double _renderButtonHeight() {
    return style.buttonSize == PIButtonSize.big ? 96.rpx : 64.rpx;
  }
}
