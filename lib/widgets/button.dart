import 'package:sparrow_ui/ui.dart';

class SPButton extends StatelessWidget {
  final Function onTap;
  final double width;
  final double height;
  final String content;
  final Color color;
  final Color contentColor;
  final BoxBorder border;
  SPButton({
    Key key,
    this.onTap,
    this.width,
    this.height,
    this.content,
    this.color,
    this.contentColor,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.rpx)),
          border: border,
          color: color,
        ),
        child: Text(
          content,
          style: TextStyle(
            color: contentColor,
            fontSize: 30.rpx,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}

class SPButton80 extends SPButton {
  final Function onTap;
  final double width;
  final String content;
  SPButton80({
    Key key,
    this.onTap,
    this.width,
    this.content,
    Color color,
    Color contentColor,
    BoxBorder border,
  }) : super(
          key: key,
          onTap: onTap,
          width: width,
          height: 80.rpx,
          content: content,
          color: color,
          contentColor: contentColor,
          border: border,
        );
}

class SPButton60 extends SPButton {
  final Function onTap;
  final double width;
  final String content;
  SPButton60({
    Key key,
    this.onTap,
    this.width,
    this.content,
    Color color,
    Color contentColor,
    BoxBorder border,
  }) : super(
          key: key,
          onTap: onTap,
          width: width,
          height: 60.rpx,
          content: content,
          color: color,
          contentColor: contentColor,
          border: border,
        );
}
