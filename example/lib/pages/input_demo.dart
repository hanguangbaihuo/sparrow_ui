import 'package:app/common.dart';

class InputDemo extends StatelessWidget {
  const InputDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('输入框')),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.rpx, vertical: 10.rpx),
            child: PIInput(),
          ),
          ListTile(),
        ],
      ),
    );
  }
}
