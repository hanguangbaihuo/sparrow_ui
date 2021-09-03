import 'package:sparrow_ui/sparrow_ui.dart';

/// ListItem
///
/// 种类：
/// 如果可以点击最右面有箭头
/// 类似设置页面信息展示，左侧标题，右侧文字，两端对齐，
/// 表单输入：左侧1/3标题，右侧2/3，输入框，比例可调呀
/// 双列表格：两列左对齐，比例可调，比例可调

class SPListItem extends StatelessWidget {
  final String? left;
  final String? right;

  final Function? onTap;

  final bool showFlag;

  final double? height;

  const SPListItem({
    Key? key,
    this.left,
    this.right,
    this.onTap,
    this.showFlag = false,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: Container(
        height: height ?? 100.rpx,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 32.rpx),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: _renderLeft(context),
            ),
            SizedBox(width: 20.rpx),
            Expanded(
              flex: 2,
              child: _renderRight(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderLeft(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              height: 44.rpx,
              child: Text(
                '$left',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 30.rpx),
              ),
            ),
          ),
          if (showFlag)
            Container(
              margin: EdgeInsets.only(left: 8.rpx),
              width: 12.rpx,
              height: 12.rpx,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.rpx),
                color: Color(0xffFE1A1A),
              ),
            ),
        ],
      ),
    );
  }

  Widget _renderRight(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              alignment: Alignment.centerRight,
              height: 44.rpx,
              child: Text(
                right ?? '',
                style: TextStyle(
                    // color: onTap == null
                    //     ? rgba(145, 148, 152, 1)
                    //     : rgba(64, 75, 85, 1),
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          // if (onTap != null)
          // Container(
          //   // margin: EdgeInsets.only(left: 8.rpx),
          //   child: Icon(
          //     LanyueIcons.tongzhiapp_youjiantou,
          //     size: 30.rpx,
          //     color: Color(0xffa6a8a9),
          //   ),
          // ),
        ],
      ),
    );
  }
}
