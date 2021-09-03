import 'package:sparrow_ui/sparrow_ui.dart';

class SPListItemDivider extends StatelessWidget {
  final double? indent;
  const SPListItemDivider({
    Key? key,
    this.indent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: indent ?? 32.rpx,
            height: 1.rpx,
            color: Color(0xffffffff),
          ),
          Expanded(
            child: Container(
              height: 1.rpx,
              color: Color(0xffe8e8e8),
            ),
          ),
        ],
      ),
    );
  }
}
