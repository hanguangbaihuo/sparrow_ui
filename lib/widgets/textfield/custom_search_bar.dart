import 'package:sparrow_ui/sparrow_ui.dart';

class CustomSearchBar extends StatefulWidget {
  CustomSearchBar({
    Key? key,
    required this.handlerSearch,
    this.onSubmitted,
    this.placeHolder,
    this.cancelText,
    this.keyboardType = TextInputType.text,
    this.backgroundColor,
    this.fillColor,
  }) : super(key: key);

  /// 搜索方法的回调函数
  final void Function(String) handlerSearch;
  final void Function(String)? onSubmitted;

  /// 提示用户输入的搜索关键字
  final String? placeHolder;

  /// 清空输入的搜索关键字文字，默认清除
  final String? cancelText;

  /// 设置弹出键盘的类型
  final TextInputType keyboardType;

  /// 输入框内的颜色
  final Color? fillColor;

  /// 输入框外的颜色
  final Color? backgroundColor;

  @override
  CustomSearchBarState createState() => CustomSearchBarState();
}

class CustomSearchBarState extends State<CustomSearchBar> {
  TextEditingController _searchController = TextEditingController();
  String? searchValue;

  @override
  void initState() {
    super.initState();
    searchValue = "";
    _bindSearchController();
  }

  /// 绑定searchValue值变化
  _bindSearchController() {
    _searchController.text = searchValue!;
    _searchController.addListener(
      () {
        searchValue = _searchController.text;
        widget.handlerSearch(_searchController.text);
      },
    );
  }

  /// 点击取消按钮
  bindCancel() {
    _searchController.text = "";
    widget.handlerSearch("");
    if (widget.onSubmitted is Function) {
      widget.onSubmitted!('');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      height: 120.rpx,
      width: 750.rpx,
      alignment: Alignment.center,
      color: widget.backgroundColor ?? PIColors.gray[2],
      padding: EdgeInsets.symmetric(vertical: 24.rpx, horizontal: 16.rpx),
      child: TextField(
        controller: _searchController,
        onSubmitted: widget.onSubmitted,
        keyboardType: widget.keyboardType,
        keyboardAppearance: Brightness.light,
        autofocus: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.fillColor ?? Colors.white,
          contentPadding: EdgeInsets.all(0),
          // prefixIcon: Icon(
          //   LanyueIcons.tongzhiapp_sousuo,
          //   size: 35.rpx,
          //   color: theme.colorScheme.textLightColor,
          // ),
          hintText: widget.placeHolder ?? "",
          hintStyle: TextStyle(
            fontSize: 32.rpx,
            backgroundColor: widget.fillColor ?? Colors.white,
            color: PIColors.gray[4],
          ),
          suffix: InkWell(
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
          focusedBorder: OutlineInputBorder(
            borderRadius: PIBorderRadius.big,
            borderSide: BorderSide(
              color: PIColors.gray[2]!,
              width: 2.rpx,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: PIBorderRadius.big,
            borderSide: BorderSide(
              color: PIColors.gray[2]!,
              width: 2.rpx,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: PIBorderRadius.big,
            borderSide: BorderSide(
              color: PIColors.gray[2]!,
              width: 2.rpx,
            ),
          ),
        ),
        textInputAction: TextInputAction.search,
        style: TextStyle(
          backgroundColor: widget.fillColor ?? Colors.white,
          color: Color(0xff202020),
          fontSize: 32.rpx,
        ),
      ),
    );
  }
}
