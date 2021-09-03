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
          PIGap.large(),
          PIButton(
            content: 'Icon 主色 主要',
            icon: Icons.person,
            onPressed: () {},
          ),
          PIGap.large(),
          PIButton(
            content: 'Success 主要',
            style: PIButtonStyle(colorSense: PIColorSense.success),
            onPressed: () {},
          ),
          PIGap.large(),
          PIButton(
            content: 'Warning 主要',
            style: PIButtonStyle(colorSense: PIColorSense.warning),
            onPressed: () {},
          ),
          PIGap.large(),
          PIButton(
            content: 'Error 主要',
            style: PIButtonStyle(colorSense: PIColorSense.error),
            onPressed: () {},
          ),
          PIGap.large(),
          PIButton(
            content: 'Inactive 主要',
            icon: Icons.add,
            style: PIButtonStyle(buttonStatus: PIButtonStatus.inactive),
            onPressed: () {},
          ),
          PIGap.large(),
          PIButton(
            content: 'Error Disabled 主要',
            icon: Icons.delete,
            style: PIButtonStyle(
              buttonStatus: PIButtonStatus.disabled,
              colorSense: PIColorSense.error,
            ),
            onPressed: () {},
          ),
          PIGap.largeXX(),
          PIButton(
            content: 'icon 主色 次要',
            icon: Icons.add,
            onPressed: () {},
            style: PIButtonStyle(
              buttonType: PIButtonType.secondary,
            ),
          ),
          PIGap.large(),
          PIButton(
            content: 'Success 次要',
            style: PIButtonStyle(
              colorSense: PIColorSense.success,
              buttonType: PIButtonType.secondary,
            ),
            onPressed: () {},
          ),
          PIGap.large(),
          PIButton(
            content: 'Warning 次要',
            style: PIButtonStyle(
              colorSense: PIColorSense.warning,
              buttonType: PIButtonType.secondary,
            ),
            onPressed: () {},
          ),
          PIGap.large(),
          PIButton(
            content: 'Error 次要',
            style: PIButtonStyle(
              colorSense: PIColorSense.error,
              buttonType: PIButtonType.secondary,
            ),
            onPressed: () {},
          ),
          PIGap.large(),
          PIButton(
            content: 'Inactive 次要',
            icon: Icons.add,
            style: PIButtonStyle(
              buttonStatus: PIButtonStatus.inactive,
              buttonType: PIButtonType.secondary,
            ),
            onPressed: () {},
          ),
          PIGap.large(),
          PIButton(
            content: 'Error Disabled 次要',
            icon: Icons.delete,
            style: PIButtonStyle(
              buttonStatus: PIButtonStatus.disabled,
              colorSense: PIColorSense.error,
              buttonType: PIButtonType.secondary,
            ),
            onPressed: () {},
          ),
          PIGap.large(),
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
                  buttonType: PIButtonType.primary,
                ),
              ),
              PIButton(
                content: '按钮',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.primary,
                  colorSense: PIColorSense.success,
                ),
              ),
              PIButton(
                content: '按钮',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.primary,
                  colorSense: PIColorSense.warning,
                ),
              ),
              PIButton(
                content: '危险',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.primary,
                  colorSense: PIColorSense.error,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PIButton(
                content: 'Button',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonStatus: PIButtonStatus.inactive,
                ),
              ),
              PIButton(
                content: '按钮',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.primary,
                  buttonStatus: PIButtonStatus.inactive,
                ),
              ),
              PIButton(
                content: '按钮',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.primary,
                  colorSense: PIColorSense.success,
                  buttonStatus: PIButtonStatus.inactive,
                ),
              ),
              PIButton(
                content: '按钮',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.primary,
                  colorSense: PIColorSense.warning,
                  buttonStatus: PIButtonStatus.inactive,
                ),
              ),
              PIButton(
                content: '危险',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.primary,
                  colorSense: PIColorSense.error,
                  buttonStatus: PIButtonStatus.inactive,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PIButton(
                content: 'Button',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonStatus: PIButtonStatus.disabled,
                ),
              ),
              PIButton(
                content: '按钮',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.primary,
                  buttonStatus: PIButtonStatus.disabled,
                ),
              ),
              PIButton(
                content: '按钮',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.primary,
                  colorSense: PIColorSense.success,
                  buttonStatus: PIButtonStatus.disabled,
                ),
              ),
              PIButton(
                content: '按钮',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.primary,
                  colorSense: PIColorSense.warning,
                  buttonStatus: PIButtonStatus.disabled,
                ),
              ),
              PIButton(
                content: '危险',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.primary,
                  colorSense: PIColorSense.error,
                  buttonStatus: PIButtonStatus.disabled,
                ),
              ),
            ],
          ),

          // secondary
          PIGap.large(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PIButton(
                content: 'Button',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.secondary,
                ),
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
                content: '按钮',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.secondary,
                  colorSense: PIColorSense.success,
                  buttonStatus: PIButtonStatus.normal,
                ),
              ),
              PIButton(
                content: '按钮',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.secondary,
                  colorSense: PIColorSense.warning,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PIButton(
                content: 'Button',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.secondary,
                  buttonStatus: PIButtonStatus.inactive,
                ),
              ),
              PIButton(
                content: '按钮',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.secondary,
                  buttonStatus: PIButtonStatus.inactive,
                ),
              ),
              PIButton(
                content: '按钮',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.secondary,
                  colorSense: PIColorSense.success,
                  buttonStatus: PIButtonStatus.inactive,
                ),
              ),
              PIButton(
                content: '按钮',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.secondary,
                  colorSense: PIColorSense.warning,
                  buttonStatus: PIButtonStatus.inactive,
                ),
              ),
              PIButton(
                content: '危险',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.secondary,
                  colorSense: PIColorSense.error,
                  buttonStatus: PIButtonStatus.inactive,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PIButton(
                content: 'Button',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.secondary,
                  buttonStatus: PIButtonStatus.disabled,
                ),
              ),
              PIButton(
                content: '按钮',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.secondary,
                  buttonStatus: PIButtonStatus.disabled,
                ),
              ),
              PIButton(
                content: '按钮',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.secondary,
                  colorSense: PIColorSense.success,
                  buttonStatus: PIButtonStatus.disabled,
                ),
              ),
              PIButton(
                content: '按钮',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.secondary,
                  colorSense: PIColorSense.warning,
                  buttonStatus: PIButtonStatus.disabled,
                ),
              ),
              PIButton(
                content: '危险',
                onPressed: () {},
                style: PIButtonStyle(
                  buttonSize: PIButtonSize.small,
                  buttonType: PIButtonType.secondary,
                  colorSense: PIColorSense.error,
                  buttonStatus: PIButtonStatus.disabled,
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
