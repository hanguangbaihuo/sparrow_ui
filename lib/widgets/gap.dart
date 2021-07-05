import 'package:sparrow_ui/sparrow_ui.dart';

class SPGap extends StatelessWidget {
  final double? height;
  const SPGap({Key? key, this.height}) : super(key: key);

  SPGap.small() : height = 8.rpx;
  SPGap.medium() : height = 16.rpx;
  SPGap.large() : height = 24.rpx;
  SPGap.largeX() : height = 32.rpx;
  SPGap.largeXX() : height = 48.rpx;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height ?? 8.rpx);
  }
}
