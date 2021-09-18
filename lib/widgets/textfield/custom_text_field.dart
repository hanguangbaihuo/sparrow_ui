import 'package:flutter/services.dart';
import 'package:sparrow_ui/sparrow_ui.dart';
import 'package:sparrow_ui/style/base/base_style.dart';
import 'package:sparrow_ui/style/text_field_style.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.textFieldStyle,
  }) : super(key: key);
  final PIBaseStyle? textFieldStyle;

  @override
  State<StatefulWidget> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool clearButton = false;
  TextEditingController? _valueController;
  PITextFieldStyle? _textFieldStyle;
  @override
  void initState() {
    super.initState();
    _textFieldStyle =
        (widget.textFieldStyle ?? PITextFieldStyle()) as PITextFieldStyle?;
    _valueController = _textFieldStyle?.controller;
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
    return _textFieldStyle?.maxLines == 1
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
        textAlign: _textFieldStyle?.textAlign ?? TextAlign.left,
        controller: _textFieldStyle?.controller,
        keyboardType: _textFieldStyle?.keyboardType,
        maxLines: _textFieldStyle?.maxLines,
        minLines: _textFieldStyle?.minLines,
        maxLength: _textFieldStyle?.maxLength,
        // cursorWidth: 1.0,
        autofocus: _textFieldStyle?.autoFocus ?? false,

        // 设置弹出键盘为亮色模式
        keyboardAppearance: Brightness.light,
        textInputAction:
            _textFieldStyle?.textInputAction ?? TextInputAction.done,
        inputFormatters: _textFieldStyle?.inputFormatters,
        decoration: InputDecoration(
          prefixIcon: _textFieldStyle?.showPrefixIcon == true
              ? Icon(
                  Icons.search,
                  size: 36.rpx,
                  color: PIColors.gray[5]!,
                )
              : null,
          // 给输入框内容添加内边距可以使内容居中
          contentPadding: _textFieldStyle?.contentPadding ??
              EdgeInsets.fromLTRB(20.rpx, 0.rpx, 10.rpx, 0.rpx),
          // contentPadding: contentPadding ?? EdgeInsets.all(10.rpx),
          border: _textFieldStyle?.showBorder == false
              ? OutlineInputBorder(
                  borderSide: BorderSide.none,
                )
              : null,
          // 可使用的边框
          enabledBorder: _textFieldStyle?.showBorder == true
              ? OutlineInputBorder(
                  borderRadius: PIBorderRadius.small,
                  borderSide: BorderSide(
                      color: _textFieldStyle?.borderColor ?? PIColors.gray[2]!,
                      width: _textFieldStyle?.borderWidth ?? 1.rpx),
                )
              : null,
          // 聚焦的边框
          focusedBorder: _textFieldStyle?.showBorder == true
              ? OutlineInputBorder(
                  borderRadius: PIBorderRadius.small,
                  borderSide: BorderSide(
                      color: _textFieldStyle?.borderFocusColor ??
                          PIColors.gray[5]!,
                      width: _textFieldStyle?.borderWidth ?? 1.rpx),
                )
              : null,
          // 没有内容时候的占位符与样式
          hintText: _textFieldStyle?.placeholder ?? "",
          hintStyle: _textFieldStyle?.placeholderStyle ??
              TextStyle(
                color: PIColors.gray[4]!,
                fontSize: 28.rpx,
              ),
          // hintMaxLines: 1,
          hintMaxLines: _textFieldStyle?.hintMaxLines,
          suffix: _textFieldStyle?.isSearch == false
              ? _textFieldStyle?.suffix
              : InkWell(
                  onTap: () {
                    ///移除键盘
                    FocusScope.of(context).requestFocus(new FocusNode());
                    bindCancel();
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20.rpx, 0, 20.rpx, 0),
                    child: Text(
                      _textFieldStyle?.cancelText ?? "取消",
                      style: TextStyle(
                        color: Color(0xff606B89),
                        fontSize: 28.rpx,
                      ),
                    ),
                  ),
                ),
          prefix: _textFieldStyle?.prefix,
          suffixIcon: _textFieldStyle?.isSearch == true
              ? null
              : _textFieldStyle?.showClearButton == true
                  ? Visibility(
                      visible: clearButton,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: InkWell(
                        onTap: () {
                          _textFieldStyle?.controller?.text = '';
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
        style: _textFieldStyle?.textStyle ??
            TextStyle(
              color: PIColors.gray[10]!,
              fontSize: 28.rpx,
            ),
        onSubmitted: (value) {
          if (_textFieldStyle?.onSubmitted != null)
            _textFieldStyle?.onSubmitted!(value);
        },
      );

  /// 点击取消按钮
  bindCancel() {
    _valueController?.text = "";
    if (_textFieldStyle?.handlerSearch != null)
      _textFieldStyle?.handlerSearch!("");
    if (_textFieldStyle?.onSubmitted is Function) {
      _textFieldStyle?.onSubmitted!('');
    }
  }
}
