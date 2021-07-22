import 'package:sparrow_ui/sparrow_ui.dart';

class PISpacerRow extends StatelessWidget {
  final Widget? left;
  final Widget? right;
  const PISpacerRow({Key? key, this.left, this.right}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(child: left!),
        // Spacer(),
        Container(
          margin: EdgeInsets.only(left: 20.rpx),
          // constraints: BoxConstraints(maxWidth: 250.rpx),
          child: right,
        )
      ],
    );
  }
}
