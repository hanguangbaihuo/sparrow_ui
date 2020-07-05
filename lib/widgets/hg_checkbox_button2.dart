import 'package:sparrow_ui/ui.dart';

import './hg_button.dart';

final _uncheckedDecoration = BoxDecoration(
  // color: rgba(245, 245, 245, 1),
  color: rgba(255, 255, 255, 1),

  borderRadius: BorderRadius.all(Radius.circular(10.rpx)),
);

final _checkedDecoration = BoxDecoration(
  // color: rgba(255, 255, 255, 1),
  color: rgba(248, 47, 63, 0.08),
  borderRadius: BorderRadius.all(Radius.circular(10.rpx)),

  border: Border.all(
    color: rgba(248, 47, 63, 1),
    width: 2.rpx,
  ),
);

class HGCheckboxButton2 extends StatelessWidget {
  final String content;
  final bool checked;
  final Function onTap;
  final double width;

  const HGCheckboxButton2({
    Key key,
    @required this.content,
    @required this.checked,
    @required this.onTap,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: checked ? _checkedDecoration : _uncheckedDecoration,
      child: HGButton60(
        onTap: onTap,
        width: width,
        content: content,
        contentColor: checked ? rgba(248, 47, 63, 1) : rgba(33, 37, 41, 1),
        color: checked ? rgba(248, 47, 63, 0.08) : rgba(245, 245, 245, 1),
      ),
    );
  }
}
