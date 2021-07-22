import 'package:sparrow_ui/sparrow_ui.dart';

final _uncheckedDecoration = BoxDecoration(
  color: Colors.white,
  // borderRadius: BorderRadius.all(Radius.circular(10.rpx)),
);

final _checkedDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(
    color: Color.fromRGBO(248, 47, 63, 1),
    width: 2.rpx,
  ),
);

class PICheckboxButton extends StatelessWidget {
  final Widget? child;
  final bool? checked;
  final Function? onTap;
  final double? width;

  const PICheckboxButton(
      {Key? key, this.child, this.checked, this.onTap, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        width: width,
        // height: 60.rpx,
        // color: Colors.white,

        alignment: Alignment.center,
        decoration: checked! ? _checkedDecoration : _uncheckedDecoration,
        child: child,
      ),
    );
  }
}
