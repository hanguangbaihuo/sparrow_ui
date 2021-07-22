import 'package:sparrow_ui/sparrow_ui.dart';

class PIGap extends StatelessWidget {
  final double? height;
  const PIGap({Key? key, this.height}) : super(key: key);

  PIGap.small() : height = 8.rpx;
  PIGap.medium() : height = 16.rpx;
  PIGap.large() : height = 24.rpx;
  PIGap.largeX() : height = 32.rpx;
  PIGap.largeXX() : height = 48.rpx;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height ?? 8.rpx);
  }
}
