/// 加载更多组件说明：
/// 使用场景：目前主要在页面数据加载完成，没有更多数据的时候的显示。
/// 参数：
/// text设置分割线中间的文字，默认为“没有更多数据啦”
/// color设置分割线和文字的颜色，默认为rgba(193, 199, 206, 1)
/// isLoading 设置是否为加载中的样式
/// loadingText 设置加载中的文字显示
/// 注意：
/// 设置文字的时候，字数太多会省略
/// 分割线组件整体高度为150.rpx

import 'package:sparrow_ui/sparrow_ui.dart';

enum PILoadMoreStatus {
  /// 什么都不显示
  none,

  /// 加载更多中
  loading,

  /// 没有更多
  noMore,
}

/// 加载更多，显示转圈圈或者没有更多数据、或者什么都不显示
class PILoadMore extends StatelessWidget {
  const PILoadMore({
    Key? key,
    this.color,
    this.noMoreText,
    this.status = PILoadMoreStatus.none,
    this.loadingText,
  }) : super(key: key);

  /// 自定义分割线文字，默认为“没有更多数据啦”
  final String? noMoreText;

  final PILoadMoreStatus status;

  /// 自定义加载中的文字信息
  final String? loadingText;

  /// 自定义分割线文字和线条的颜色，默认为rgba(193, 199, 206, 1)
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.rpx,
      alignment: Alignment.center,
      child: _renderContent(),
    );
  }

  /// 渲染加载中的分割线样式
  Widget _renderContent() {
    switch (status) {
      case PILoadMoreStatus.noMore:
        return Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 左边线条
              _renderLine(),
              // 中间文字
              Container(
                margin: EdgeInsets.only(left: 48.rpx, right: 48.rpx),
                child: Text(
                  noMoreText ?? "没有更多数据啦",
                  style: TextStyle(
                    // color: color ?? rgba(219, 223, 228, 1),
                    fontSize: 24.rpx,
                    height: 1,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // 右边线条
              _renderLine(),
            ],
          ),
        );
      case PILoadMoreStatus.loading:
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(right: 20.rpx),
                width: 20.rpx,
                height: 20.rpx,
                child: CircularProgressIndicator(
                  strokeWidth: 3.rpx,
                  // valueColor:
                  // AlwaysStoppedAnimation(color ?? rgba(193, 199, 206, 1)),
                ),
              ),

              // 加载文字
              Text(
                loadingText ?? "加载中...",
                style: TextStyle(
                  // color: color ?? rgba(219, 223, 228, 1),
                  fontSize: 24.rpx,
                  height: 1,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      default:
        return Container();
    }
  }

  /// 生成分割线
  Widget _renderLine() {
    return Container(
      width: 120.rpx,
      height: 1.rpx,
      // color: color ?? rgba(219, 223, 228, 1),
    );
  }
}
