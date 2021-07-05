import 'package:sparrow_ui/sparrow_ui.dart';

/// 类型
///   - 主按钮primary，颜色填充，白色文字
///   - 次按钮secondary，外描边，浅色填充，颜色文字
///
/// 颜色
///   - 主色
///   - 危险
///   - 成功
///
/// 所有的按钮都是在2 * 5之间
///

/// 按钮类型
enum SPButtonType {
  /// 主按钮，颜色填充，白色文字
  primary,

  /// 次按钮：外描边，浅色填充，颜色文字
  secondary,
}

class SPButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final double? width;
  final double? height;
  final String? content;
  final Color? color;
  final Color? contentColor;
  final BoxBorder? border;
  final SPColorSense colorSense;
  final SPButtonType type;
  SPButton({
    Key? key,
    this.onTap,
    this.width,
    this.height,
    this.content,
    this.color,
    this.contentColor,
    this.border,
    this.colorSense = SPColorSense.primary,
    this.type = SPButtonType.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = SPTheme.of(context);
    final colorSwatch = theme.cSPColorSense[type];
    return MaterialButton(
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.rpx)),
          border: border,
          color: color,
        ),
        child: Text(
          content!,
          style: TextStyle(
            color: contentColor,
            fontSize: 30.rpx,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      onPressed: () {},
    );
  }
}
