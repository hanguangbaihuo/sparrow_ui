import 'package:sparrow_ui/sparrow_ui.dart';

class SPGrid extends StatelessWidget {
  final Widget? child;
  final double width;
  final double height;
  const SPGrid(
      {Key? key, this.child, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(minHeight: double.infinity, minWidth: double.infinity),
      alignment: Alignment.center,
      // constraints:  BoxConstraints.expand(),
      // height: MediaQuery.of(context).size.height.rpx,
      // color: Colors.white,
      width: width,
      height: height,
      child: child,
    );
  }
}
