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
  final String content;
  final SPColorSense colorSense;
  final SPButtonType type;
  SPButton({
    Key? key,
    this.onTap,
    required this.content,
    this.colorSense = SPColorSense.primary,
    this.type = SPButtonType.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = SPTheme.of(context);
    // 注意此处，map取值的类型检查
    final colorSwatch = theme.cSPColorSense[colorSense];

    if (type == SPButtonType.secondary) {
      return MaterialButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SPSize.radiusSmall),
          side: type == SPButtonType.secondary
              ? BorderSide(
                  width: 1.rpx,
                  color: colorSwatch![3]!,
                )
              : BorderSide.none,
        ),
        color: colorSwatch![1]!,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            content,
            style: TextStyle(
              color: colorSwatch[6]!,
              fontSize: 30.rpx,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        onPressed: () {},
      );
    }
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SPSize.radiusSmall),
      ),
      elevation: 0,
      color: colorSwatch![6],
      child: Container(
        alignment: Alignment.center,
        // width: width,
        // height: height,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.all(Radius.circular(10.rpx)),
        //   border: border,
        //   color: color,
        // ),
        child: Text(
          content,
          style: TextStyle(
            color: SPColors.white,
            fontSize: 30.rpx,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      onPressed: () {},
    );
  }
}
