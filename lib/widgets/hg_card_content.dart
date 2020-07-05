import 'package:sparrow_ui/ui.dart';
import './hg_card.dart';

class HGCardContent extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const HGCardContent({
    Key key,
    this.child,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HGCard(
      backgroundColor: backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(20.rpx),
        child: child,
      ),
    );
  }
}
