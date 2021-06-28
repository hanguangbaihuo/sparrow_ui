import 'package:sparrow_ui/ui.dart';
import 'package:sparrow_utils/sparrow_utils.dart';

import './grid.dart';

class SPGridContainer extends StatelessWidget {
  final int crossAxisCount;
  final double itemSpacing;
  final double? itemHeight;
  final double rowSpacing;
  final double width;
  final List<Widget> children;
  final Color backgroundColor;
  const SPGridContainer(
      {Key? key,
      required this.crossAxisCount,
      required this.children,
      required this.width,
      this.itemHeight, // 如果不设置高度就等于宽度
      double? itemSpacing,
      double? rowSpacing,
      Color? backgroundColor})
      : this.itemSpacing = itemSpacing ?? 0.0,
        this.rowSpacing = rowSpacing ?? 0.0,
        this.backgroundColor = backgroundColor ?? Colors.white,
        super(key: key);

// 计算行
//

  @override
  Widget build(BuildContext context) {
    var count = children.length;
    var gridWidth =
        (width - (crossAxisCount - 1) * itemSpacing) / crossAxisCount;
    var gridHeight = itemHeight ?? gridWidth;
    final List<Widget> rows = [];
    for (var i = 0; i < count; i += (crossAxisCount)) {
      var endIndex = i + crossAxisCount;
      List<Widget> items = List<Widget>.from(
        SPCollectionUtils.map(
          children.sublist(i, endIndex <= count ? endIndex : count),
          (int index, Widget item) {
            return SPGrid(
              width: gridWidth,
              height: gridHeight,
              child: Container(
                margin: EdgeInsets.only(left: index == 0 ? 0.0 : itemSpacing),
                child: item,
              ),
            );
          },
        ),
      );

      // 如果最后一行不足个数，用空白格补全
      while (items.length < crossAxisCount) {
        items.add(SPGrid(
          width: gridWidth,
          height: gridHeight,
        ));
      }
      rows.add(
        Container(
          color: backgroundColor,
          margin: EdgeInsets.only(top: i == 0 ? 0.0 : rowSpacing),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items,
          ),
        ),
      );
    }

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14.rpx),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: rows,
      ),
    );
  }
}
