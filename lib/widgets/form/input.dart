import 'package:sparrow_ui/sparrow_ui.dart';
import 'package:flutter/services.dart';

class PIInput extends StatelessWidget {
  const PIInput({
    Key? key,
    this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.borderWidth,
    this.borderColor,
    this.maxLines = 1,
    this.minLines = 1,
    this.hintMaxLines = 1,
    this.autoFocus = false,
    this.maxLength,
    this.borderFocusColor,
    this.placeholder,
    this.placeholderStyle,
    this.contentPadding,
    this.textStyle,
    this.textAlign,
    this.suffix,
    this.prefix,
    this.textInputAction,
    this.onSubmitted,
  }) : super(key: key);

  /// 输入框控制器
  final TextEditingController? controller;

  /// 键盘类型
  final TextInputType? keyboardType;

  /// 用于指定输入格式；当用户输入内容改变时，会根据指定的格式来校验。
  final List<TextInputFormatter>? inputFormatters;

  /// 边框的宽度
  final double? borderWidth;

  /// 边框的颜色
  final Color? borderColor;

  /// 边框聚焦时候的颜色
  final Color? borderFocusColor;

  /// 输入框没有内容时候的占位内容
  final String? placeholder;

  /// 占位内容的文字样式
  final TextStyle? placeholderStyle;

  /// 输入框内边距
  final EdgeInsetsGeometry? contentPadding;

  /// 输入框文字样式
  final TextStyle? textStyle;

  /// 输入框的文字对齐方式
  final TextAlign? textAlign;

  /// 左侧内容
  final Widget? prefix;

  /// 右侧内容
  final Widget? suffix;

  ///最大行数
  final int maxLines;

  ///最小行数
  final int minLines;

  ///最大长度
  final int? maxLength;
  final int? hintMaxLines;

  ///
  final bool autoFocus;

  /// 键盘右下角按钮显示的文字
  final TextInputAction? textInputAction;

  final Function? onSubmitted;

  // // 多行输入框
  // const SPInput.textarea();

  // // 单向选择
  // const SPInput.select();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        textAlign: textAlign ?? TextAlign.left,
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        // cursorWidth: 1.0,
        autofocus: autoFocus,
        // 设置弹出键盘为亮色模式
        keyboardAppearance: Brightness.light,
        textInputAction: textInputAction ?? TextInputAction.done,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          // 给输入框内容添加内边距可以使内容居中
          contentPadding: contentPadding ??
              EdgeInsets.fromLTRB(20.rpx, 0.rpx, 10.rpx, 0.rpx),
          // contentPadding: contentPadding ?? EdgeInsets.all(10.rpx),
          // 可使用的边框
          enabledBorder: OutlineInputBorder(
            borderRadius: PIBorderRadius.small,
            borderSide: BorderSide(
              // color: borderColor ?? rgba(217, 217, 217, 1),
              width: borderWidth ?? 1.rpx,
            ),
          ),
          // 聚焦的边框
          focusedBorder: OutlineInputBorder(
            borderRadius: PIBorderRadius.small,
            borderSide: BorderSide(
              // color: borderFocusColor ?? rgba(16, 119, 254, 1),
              width: borderWidth ?? 1.rpx,
            ),
          ),
          // 没有内容时候的占位符与样式
          hintText: placeholder ?? "",
          hintStyle: placeholderStyle ??
              TextStyle(
                // color: rgba(179, 179, 179, 1),
                fontSize: 28.rpx,
              ),
          // hintMaxLines: 1,
          hintMaxLines: hintMaxLines,
          suffix: suffix,
          prefix: prefix,
        ),
        // 输入框输入的内容的样式

        textAlignVertical: TextAlignVertical.center,
        style: textStyle ??
            TextStyle(
              // color: rgba(64, 75, 85, 1),
              fontSize: 28.rpx,
            ),
        onSubmitted: (value) {
          if (onSubmitted != null) onSubmitted!(value);
        },
      ),
    );
  }
}
