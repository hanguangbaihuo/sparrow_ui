import 'package:sparrow_ui/ui.dart';
import './card.dart';

class SPCardContent extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;

  const SPCardContent({
    Key? key,
    this.child,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SPCard(
      backgroundColor: backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(20.rpx),
        child: child,
      ),
    );
  }
}
