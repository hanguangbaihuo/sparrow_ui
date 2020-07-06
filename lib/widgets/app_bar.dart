import 'package:sparrow_ui/ui.dart';

class SPAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;
  final Widget child;
  final Color backgroudColor;

  SPAppBar({Key key, this.child, Color backgroudColor})
      : preferredSize = Size.fromHeight(88.rpx),
        this.backgroudColor = backgroudColor ?? rgba(255, 255, 255, 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SPUI.getStatusBarHeight().rpx + 88.rpx,
      padding: EdgeInsets.only(top: SPUI.getStatusBarHeight().rpx),
      decoration: BoxDecoration(
        color: backgroudColor,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 1.rpx,
            spreadRadius: 2.rpx,
          ),
        ],
      ),
      child: child,
    );
  }
}
