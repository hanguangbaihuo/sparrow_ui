import 'package:flutter/services.dart';
import 'package:sparrow_ui/sparrow_ui.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
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
    this.handlerSearch,
    this.cancelText,
    this.showBorder = true,
    this.showPrefixIcon = false,
    this.showClearButton = false,
    this.isSearch = false,
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

  final bool? showBorder;
  final bool? showPrefixIcon;
  final bool? showClearButton;
  final bool? isSearch;

  /// 清空输入的搜索关键字文字，默认清除
  final String? cancelText;

  /// 搜索方法的回调函数
  final Function(String)? handlerSearch;

  @override
  State<StatefulWidget> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool clearButton = false;
  TextEditingController? _valueController;
  @override
  void initState() {
    super.initState();
    _valueController = widget.controller;
    _valueController?.addListener(() {
      String? value = _valueController?.text.trim();
      if (value!.isNotEmpty) {
        clearButton = true;
        _refresh();
      }
    });
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.maxLines == 1
        ? Container(
            alignment: Alignment.centerLeft,
            height: 80.rpx,
            child: textField(),
          )
        : Container(
            alignment: Alignment.centerLeft,
            child: textField(),
          );
  }

  ///textfield
  Widget textField() => TextField(
        textAlign: widget.textAlign ?? TextAlign.left,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        maxLength: widget.maxLength,
        // cursorWidth: 1.0,
        autofocus: widget.autoFocus,

        // 设置弹出键盘为亮色模式
        keyboardAppearance: Brightness.light,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          prefixIcon: widget.showPrefixIcon == true
              ? Icon(
                  Icons.search,
                  size: 36.rpx,
                  color: PIColors.gray[5]!,
                )
              : null,
          // 给输入框内容添加内边距可以使内容居中
          contentPadding: widget.contentPadding ??
              EdgeInsets.fromLTRB(20.rpx, 0.rpx, 10.rpx, 0.rpx),
          // contentPadding: contentPadding ?? EdgeInsets.all(10.rpx),
          border: widget.showBorder == false
              ? OutlineInputBorder(
                  borderSide: BorderSide.none,
                )
              : null,
          // 可使用的边框
          enabledBorder: widget.showBorder == true
              ? OutlineInputBorder(
                  borderRadius: PIBorderRadius.small,
                  borderSide: BorderSide(
                      color: widget.borderColor ?? PIColors.gray[2]!,
                      width: widget.borderWidth ?? 1.rpx),
                )
              : null,
          // 聚焦的边框
          focusedBorder: widget.showBorder == true
              ? OutlineInputBorder(
                  borderRadius: PIBorderRadius.small,
                  borderSide: BorderSide(
                      color: widget.borderFocusColor ?? PIColors.gray[5]!,
                      width: widget.borderWidth ?? 1.rpx),
                )
              : null,
          // 没有内容时候的占位符与样式
          hintText: widget.placeholder ?? "",
          hintStyle: widget.placeholderStyle ??
              TextStyle(
                color: PIColors.gray[4]!,
                fontSize: 28.rpx,
              ),
          // hintMaxLines: 1,
          hintMaxLines: widget.hintMaxLines,
          suffix: widget.isSearch == false
              ? widget.suffix
              : InkWell(
                  onTap: () {
                    ///移除键盘
                    FocusScope.of(context).requestFocus(new FocusNode());
                    bindCancel();
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20.rpx, 0, 20.rpx, 0),
                    child: Text(
                      widget.cancelText ?? "取消",
                      style: TextStyle(
                        color: Color(0xff606B89),
                        fontSize: 28.rpx,
                      ),
                    ),
                  ),
                ),
          prefix: widget.prefix,
          suffixIcon: widget.isSearch == true
              ? null
              : widget.showClearButton == true
                  ? Visibility(
                      visible: clearButton,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: InkWell(
                        onTap: () {
                          widget.controller?.text = '';
                          setState(() {
                            clearButton = false;
                          });
                        },
                        child: Icon(
                          Icons.clear,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : null,
        ),
        // 输入框输入的内容的样式

        textAlignVertical: TextAlignVertical.center,
        style: widget.textStyle ??
            TextStyle(
              color: PIColors.gray[10]!,
              fontSize: 28.rpx,
            ),
        onSubmitted: (value) {
          if (widget.onSubmitted != null) widget.onSubmitted!(value);
        },
      );

  /// 点击取消按钮
  bindCancel() {
    _valueController?.text = "";
    if (widget.handlerSearch != null) widget.handlerSearch!("");
    if (widget.onSubmitted is Function) {
      widget.onSubmitted!('');
    }
  }
}
