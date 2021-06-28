import 'package:sparrow_ui/ui.dart';

class SPSpacerRow extends StatelessWidget {
  final Widget? left;
  final Widget? right;
  const SPSpacerRow({Key? key, this.left, this.right}) : super(key: key);

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
