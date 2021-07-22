import 'package:sparrow_ui/sparrow_ui.dart';

class PIDivider extends StatelessWidget {
  final Color? color;
  final double? height;
  const PIDivider({Key? key, this.color, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Divider(
        height: height ?? 48.rpx,
        color: color ?? Color.fromRGBO(245, 245, 245, 1),
      ),
    );
  }
}
