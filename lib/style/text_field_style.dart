import 'package:flutter/services.dart';
import 'package:sparrow_ui/sparrow_ui.dart';

import 'base/base_style.dart';

///text Field style
class PITextFieldStyle extends PIBaseStyle {
  PITextFieldStyle({
    this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.borderWidth,
    this.borderColor,
    this.borderFocusColor,
    this.placeholder,
    this.placeholderStyle,
    this.contentPadding,
    this.textStyle,
    this.textAlign,
    this.textInputAction,
    this.cancelText,
    this.handlerSearch,
    this.onSubmitted,
    this.hintMaxLines,
    this.maxLength,
    this.maxLines = 1,
    this.minLines = 1,
    this.prefix,
    this.suffix,
    this.autoFocus = false,
    this.isSearch = false,
    this.showBorder = true,
    this.showClearButton = false,
    this.showPrefixIcon = false,
  }) : super();

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
  final int? maxLines;

  ///最小行数
  final int? minLines;

  ///最大长度
  final int? maxLength;
  final int? hintMaxLines;

  ///
  final bool autoFocus;

  /// 键盘右下角按钮显示的文字
  final TextInputAction? textInputAction;

  final Function? onSubmitted;

  ///显示边框
  final bool? showBorder;

  ///显示left icon
  final bool? showPrefixIcon;

  ///显示清除按钮
  final bool? showClearButton;

  ///是否是搜索框
  final bool? isSearch;

  /// 清空输入的搜索关键字文字，默认清除
  final String? cancelText;

  /// 搜索方法的回调函数
  final Function(String)? handlerSearch;
}
