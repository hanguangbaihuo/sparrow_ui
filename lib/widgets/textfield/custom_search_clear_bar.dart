import 'package:sparrow_ui/sparrow_ui.dart';

class CustomSerachClearBar extends StatefulWidget {
  CustomSerachClearBar({
    Key? key,
    required this.handlerSearch,
    this.onSubmitted,
    this.placeHolder,
    this.keyboardType = TextInputType.text,
    this.backgroundColor,
    this.fillColor,
    this.textInputAction,
  }) : super(key: key);

  /// 搜索方法的回调函数
  final void Function(String) handlerSearch;
  final void Function(String)? onSubmitted;

  /// 提示用户输入的搜索关键字
  final String? placeHolder;

  /// 设置弹出键盘的类型
  final TextInputType keyboardType;

  /// 输入框内的颜色
  final Color? fillColor;

  /// 输入框外的颜色
  final Color? backgroundColor;
  final TextInputAction? textInputAction;
  @override
  State<StatefulWidget> createState() => _CustomSearchClearBar();
}

class _CustomSearchClearBar extends State<CustomSerachClearBar> {
  TextEditingController _valueController = new TextEditingController();
  bool _isShowClearButton = false;
  String? _value;
  @override
  void initState() {
    super.initState();
    addController();
  }

  void addController() {
    _valueController.addListener(() {
      _value = _valueController.text.trim();
      widget.handlerSearch(_value!);
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    return Container(
      height: 72.rpx,
      decoration: BoxDecoration(
        border: Border.all(
          color: PIColors.gray[5]!,
          width: 1.rpx,
          style: BorderStyle.solid,
        ),
        borderRadius: PIBorderRadius.small,
      ),
      child: TextField(
        controller: _valueController,
        // maxLength: 11,
        maxLines: 1,
        keyboardType: TextInputType.datetime,
        textInputAction: widget.textInputAction == null
            ? TextInputAction.search
            : widget.textInputAction,
        keyboardAppearance: Brightness.light,
        onEditingComplete: () {
          widget.onSubmitted!(_value!);
        },
        onChanged: (value) {
          setState(() {
            _isShowClearButton = value.trim().length > 0;
          });
        },
        style: TextStyle(
          color: PIColors.gray[10]!,
          fontSize: 32.rpx,
          height: 1.5,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: PIColors.gray[2]!,
          prefixIcon: Icon(
            Icons.search,
            size: 36.rpx,
            color: PIColors.gray[5]!,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 54.rpx,
            maxWidth: 54.rpx,
            minHeight: 54.rpx,
            minWidth: 54.rpx,
          ),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          hintText: widget.placeHolder ?? "请输入要查的内容",
          hintStyle: TextStyle(
            fontSize: 32.rpx,
            height: 1.5,
            color: PIColors.gray[5]!,
          ),
          contentPadding: EdgeInsets.all(0),
          counterText: '',
          suffixIcon: Visibility(
            visible: _isShowClearButton,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: InkWell(
              onTap: () {
                _valueController.text = '';
                setState(() {
                  _isShowClearButton = false;
                });
              },
              child: Icon(
                Icons.clear,
                color: Colors.grey,
              ),
            ),
          ),
          suffixIconConstraints: BoxConstraints(
            maxHeight: 56.rpx,
            maxWidth: 56.rpx,
            minHeight: 56.rpx,
            minWidth: 56.rpx,
          ),
        ),
      ),
    );
  }
}
