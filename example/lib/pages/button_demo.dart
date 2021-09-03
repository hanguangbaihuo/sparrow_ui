import 'package:app/common.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Button Demo')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.rpx),
        children: [
          // 基础按钮
          PIBaseButton(
            content: 'PIBaseButton',
            onPressed: () {},
          ),

          PIBaseButton(
            icon: Icons.person,
            content: 'PIBaseButton',
            onPressed: () {},
          ),
          PIGap.largeXX(),
          PIButton(
            content: '默认 主色按钮Button',
            icon: Icons.person,
            onPressed: () {},
          ),
          PIGap.large(),
          PIButton(
            content: '黄色主题',
            style: PIButtonStyle(colorSense: PIColorSense.warning),
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              //   return YelloPage();
              // }));
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
                content: '按钮按钮',
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
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.person),
            label: Text("ElevatedButton.icon"),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text("OutlinedButton"),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.person),
            label: Text("OutlinedButton.icon"),
          ),
          TextButton(
            onPressed: () {},
            child: Text("TextButton"),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.person),
            label: Text("TextButton.icon"),
          ),
        ],
      ),
    );
  }
}
