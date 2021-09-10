import 'package:app/common.dart';
import 'package:app/pages/yello_page.dart';

class ButtonsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ButtonsPageState();
}

class _ButtonsPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttons"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.rpx),
        children: [
          PIGap.largeXX(),
          PIButton(
            content: '默认 主色按钮Button',
            icon: Icons.add,
            onPressed: () {},
          ),
          PIGap.large(),
          PIButton(
            content: '黄色主题',
            style: PIButtonStyle(colorSense: PIColorSense.warning),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return YelloPage();
              }));
            },
          ),
          PIGap.large(),
          PIButton(
            content: '添加店长',
            icon: Icons.add,
            onPressed: () {},
            style: PIButtonStyle(buttonType: PIButtonType.secondary),
          ),
          PIGap.large(),
          PIButton(
            content: 'Button',
            onPressed: () {},
            style: PIButtonStyle(colorSense: PIColorSense.error),
          ),
          PIGap.large(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PIButton(
                content: 'Button',
                onPressed: () {},
                style: PIButtonStyle(buttonSize: PIButtonSize.small),
              ),
              PIButton(
                content: '按钮',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.secondary,
                ),
              ),
              PIButton(
                content: '危险',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.secondary,
                  colorSense: PIColorSense.error,
                ),
              ),
            ],
          ),
          Divider(height: 100),
          ElevatedButton(
            child: Text("ElevatedButton"),
            onPressed: () {},
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text("OutlinedButton"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("TextButton"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
