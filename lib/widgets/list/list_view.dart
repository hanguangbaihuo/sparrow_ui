import 'package:sparrow_ui/sparrow_ui.dart';
import 'list_load_more.dart';

class PIListView<T> extends StatelessWidget {
  PIListView({
    Key? key,
    this.onRefresh,
    this.onLoadMore,
    required this.list,
    required this.listItem,
    this.hasNext = true,
    required this.isFirstLoading,
    this.padding,
    this.separatorWidget,
    this.scrollController,
    this.reverse = false,
    this.shrinkWrap = false,
  }) : super(key: key);

  /// 下拉刷新回调函数
  final Future Function()? onRefresh;

  /// 上拉加载更多回调
  final Future? Function()? onLoadMore;

  /// list 列表数据
  final List<T>? list;

  /// item widget回调函数
  final Widget Function(T, int) listItem;

  /// 是否还有下一页数据
  final bool? hasNext;

  /// 是否是第一次加载
  final bool isFirstLoading;

  /// 自定义分割线样式
  final Widget? separatorWidget;

  final ScrollController? scrollController;

  /// 列表的padding
  final EdgeInsets? padding;

  final bool reverse;

  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    if (onRefresh != null) {
      return RefreshIndicator(
        child: _renderBody(context),
        onRefresh: onRefresh!,
      );
    } else {
      return _renderBody(context);
    }
  }

  Widget _renderBody(BuildContext context) {
    final theme = Theme.of(context);
    if (isFirstLoading) return Center(child: CircularProgressIndicator());
    // if (list == null || list!.length == 0) {
    //   return NoMessage(
    //     label: "没有数据",
    //   );
    // }
    return Container(
      // decoration: BoxDecoration(color: theme.colorScheme.pageBackgroundColor),
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (onLoadMore != null && hasNext!) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            //重新构建
            print(progress);

            /// 滑动到70%的位置，就请求接口，加载更多数据
            if (progress.isNaN || progress > 0.7) {
              onLoadMore!();
            }
          }
          // return true; //放开此行注释后，进度条将失效
          return false;
        },
        child: Scrollbar(
          child: ListView.separated(
            shrinkWrap: shrinkWrap,
            padding: padding,
            reverse: reverse,
            physics: AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            itemCount: list!.length + 1,
            itemBuilder: (BuildContext context, int index) {
              // 最后一项用放置分割线
              if (index == list!.length) {
                return PILoadMore();
                // (
                //   isLoading: hasNext,
                // );
              }
              return listItem(list![index], index);
            },
            separatorBuilder: (context, index) {
              return separatorWidget != null
                  ? separatorWidget!
                  : Divider(
                      height: 1,
                      // color: theme.colorScheme.lineColor,
                    );
            },
          ),
        ),
      ),
    );
  }
}
