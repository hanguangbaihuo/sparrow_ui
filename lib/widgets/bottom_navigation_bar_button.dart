import 'package:sparrow_ui/sparrow_ui.dart';

class PIBottomNavigationBarButton extends StatelessWidget {
  final Function onPressed;
  final Function? onLongPress;
  final String content;
  final Color? color;
  final Color? backgroundColor;
  const PIBottomNavigationBarButton({
    Key? key,
    required this.content,
    required this.onPressed,
    this.backgroundColor,
    this.color,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Container(
          color: backgroundColor,
          child: Center(
            child: Text(
              content,
              style: TextStyle(
                color: color,
                fontSize: 34.rpx,
              ),
            ),
          ),
        ),
        onTap: onPressed as void Function()?,
        onLongPress: onLongPress as void Function()?,
      ),
    );
  }
}
