import 'package:app/common.dart';

class YelloPage extends StatelessWidget {
  const YelloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PITheme(
      data: PIThemeData(
        primarySwatch: PIColors.yello,
        secondarySwatch: PIColors.blue,
      ),
      builder: (context) {
        final theme = PITheme.of(context);
        theme.buttonStyle = theme.buttonStyle.copyWith();
        final colorScheme = ColorScheme.fromSwatch(
          primarySwatch: theme.primarySwatch.convertToFlutter,
          backgroundColor: PIColors.gray[1],
          cardColor: PIColors.white,
        );
        final flutterThemeData = ThemeData.from(colorScheme: colorScheme);
        // final theme = Theme.of(context);
        final pageTheme = theme..buttonStyle.copyWith();
        return Scaffold(
          appBar: AppBar(
            title: Text("黄色主题"),
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.rpx),
            children: [
              PIGap.largeXX(),
              PIButton(
                content: '默认 主色按钮Button',
                onPressed: () {},
              ),
              PIGap.large(),
              PIButton(
                content: '黄色主题',
                style: PIButtonStyle(colorSense: PIColorSense.error),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return YelloPage();
                  }));
                },
              ),
              PIGap.large(),
              PIButton(
                content: 'Button',
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
            ],
          ),
        );
      },
    );
  }
}
