import 'package:flutter/services.dart';
import 'package:sparrow_ui/sparrow_ui.dart';
import 'package:sparrow_ui/style/base/base_style.dart';
import 'package:sparrow_ui/style/text_field_style.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.style,
  }) : super(key: key);
  final PIBaseStyle? style;

  @override
  State<StatefulWidget> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool clearButton = false;
  TextEditingController? _valueController;
  PITextFieldStyle? _style;
  @override
  void initState() {
    super.initState();
    _style = (widget.style ?? PITextFieldStyle()) as PITextFieldStyle?;
    _valueController = _style?.controller;
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
    return _style?.maxLines == 1
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
        textAlign: _style?.textAlign ?? TextAlign.left,
        controller: _style?.controller,
        keyboardType: _style?.keyboardType,
        maxLines: _style?.maxLines,
        minLines: _style?.minLines,
        maxLength: _style?.maxLength,
        // cursorWidth: 1.0,
        autofocus: _style?.autoFocus ?? false,

        // 设置弹出键盘为亮色模式
        keyboardAppearance: Brightness.light,
        textInputAction: _style?.textInputAction ?? TextInputAction.done,
        inputFormatters: _style?.inputFormatters,
        decoration: InputDecoration(
          prefixIcon: _style?.showPrefixIcon == true
              ? Icon(
                  Icons.search,
                  size: 36.rpx,
                  color: PIColors.gray[5]!,
                )
              : null,
          // 给输入框内容添加内边距可以使内容居中
          contentPadding: _style?.contentPadding ??
              EdgeInsets.fromLTRB(20.rpx, 0.rpx, 10.rpx, 0.rpx),
          // contentPadding: contentPadding ?? EdgeInsets.all(10.rpx),
          border: _style?.showBorder == false
              ? OutlineInputBorder(
                  borderSide: BorderSide.none,
                )
              : null,
          // 可使用的边框
          enabledBorder: _style?.showBorder == true
              ? OutlineInputBorder(
                  borderRadius: PIBorderRadius.small,
                  borderSide: BorderSide(
                      color: _style?.borderColor ?? PIColors.gray[2]!,
                      width: _style?.borderWidth ?? 1.rpx),
                )
              : null,
          // 聚焦的边框
          focusedBorder: _style?.showBorder == true
              ? OutlineInputBorder(
                  borderRadius: PIBorderRadius.small,
                  borderSide: BorderSide(
                      color: _style?.borderFocusColor ?? PIColors.gray[5]!,
                      width: _style?.borderWidth ?? 1.rpx),
                )
              : null,
          // 没有内容时候的占位符与样式
          hintText: _style?.placeholder ?? "",
          hintStyle: _style?.placeholderStyle ??
              TextStyle(
                color: PIColors.gray[4]!,
                fontSize: 28.rpx,
              ),
          // hintMaxLines: 1,
          hintMaxLines: _style?.hintMaxLines,
          suffix: _style?.isSearch == false
              ? _style?.suffix
              : InkWell(
                  onTap: () {
                    ///移除键盘
                    FocusScope.of(context).requestFocus(new FocusNode());
                    bindCancel();
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20.rpx, 0, 20.rpx, 0),
                    child: Text(
                      _style?.cancelText ?? "取消",
                      style: TextStyle(
                        color: Color(0xff606B89),
                        fontSize: 28.rpx,
                      ),
                    ),
                  ),
                ),
          prefix: _style?.prefix,
          suffixIcon: _style?.isSearch == true
              ? null
              : _style?.showClearButton == true
                  ? Visibility(
                      visible: clearButton,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: InkWell(
                        onTap: () {
                          _style?.controller?.text = '';
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
        style: _style?.textStyle ??
            TextStyle(
              color: PIColors.gray[10]!,
              fontSize: 28.rpx,
            ),
        onSubmitted: (value) {
          if (_style?.onSubmitted != null) _style?.onSubmitted!(value);
        },
      );

  /// 点击取消按钮
  bindCancel() {
    _valueController?.text = "";
    if (_style?.handlerSearch != null) _style?.handlerSearch!("");
    if (_style?.onSubmitted is Function) {
      _style?.onSubmitted!('');
    }
  }
}
