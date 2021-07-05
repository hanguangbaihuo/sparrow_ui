import 'package:sparrow_ui/sparrow_ui.dart';

class SPCard extends StatelessWidget {
  final Widget child;
  final Function? onTap;
  final bool withPadding;
  final BoxBorder? border;
  final Color? backgroundColor;

  const SPCard({
    Key? key,
    this.onTap,
    required this.child,
    this.backgroundColor,
    this.border,
    bool? withPadding,
  })  : this.withPadding = withPadding ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: Container(
        width: 750.rpx,
        margin: EdgeInsets.only(top: 20.rpx),
        padding: EdgeInsets.only(left: 20.rpx, right: 20.rpx),
        child: Container(
          decoration: BoxDecoration(
            color: this.backgroundColor ?? Colors.white,
            border: border,
          ),
          padding: withPadding ? EdgeInsets.all(24.rpx) : null,
          child: child,
        ),
      ),
    );
  }
}
