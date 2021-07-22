import 'package:sparrow_ui/sparrow_ui.dart';
import './card.dart';

class PICardContent extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;

  const PICardContent({
    Key? key,
    this.child,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PICard(
      backgroundColor: backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(20.rpx),
        child: child,
      ),
    );
  }
}
