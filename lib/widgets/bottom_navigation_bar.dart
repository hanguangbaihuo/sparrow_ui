import 'package:sparrow_ui/sparrow_ui.dart';

class PIBottomNavigationBar extends StatelessWidget {
  final List<Widget> children;
  final Color? backgroundColor;
  const PIBottomNavigationBar({
    Key? key,
    required this.children,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.rpx,
      width: 750.rpx,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 1.rpx,
            offset: Offset(0, -1),
            spreadRadius: 2.rpx,
          ),
        ],
      ),
      child: Row(
        children: children,
      ),
    );
  }
}
