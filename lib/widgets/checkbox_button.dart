import 'package:sparrow_ui/ui.dart';

final _uncheckedDecoration = BoxDecoration(
  // color: rgba(245, 245, 245, 1),
  color: rgba(255, 255, 255, 1),
  // borderRadius: BorderRadius.all(Radius.circular(10.rpx)),
);

final _checkedDecoration = BoxDecoration(
  color: rgba(255, 255, 255, 1),
  // color: rgba(248, 47, 63, 0.08),
  border: Border.all(
    color: rgba(248, 47, 63, 1),
    width: 2.rpx,
  ),
);

class SPCheckboxButton extends StatelessWidget {
  final Widget? child;
  final bool? checked;
  final Function? onTap;
  final double? width;

  const SPCheckboxButton(
      {Key? key, this.child, this.checked, this.onTap, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        width: width,
        // height: 60.rpx,
        // color: rgba(255, 255, 255, 1),

        alignment: Alignment.center,
        decoration: checked! ? _checkedDecoration : _uncheckedDecoration,
        child: child,
      ),
    );
  }
}
