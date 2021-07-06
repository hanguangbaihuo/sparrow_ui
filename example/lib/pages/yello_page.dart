import 'package:app/common.dart';

class YelloPage extends StatelessWidget {
  const YelloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SPTheme(
        data: SPThemeData(
          primarySwatch: SPColors.yello,
          secondarySwatch: SPColors.blue,
        ),
        builder: (context) {
          final theme = SPTheme.of(context);
          final colorScheme = ColorScheme.fromSwatch(
            primarySwatch: theme.primarySwatch.convertToFlutter,
            backgroundColor: SPColors.gray[1],
            cardColor: SPColors.white,
          );
          final flutterThemeData = ThemeData.from(colorScheme: colorScheme);
          return Theme(
            data: flutterThemeData,
            child: Scaffold(
              appBar: AppBar(
                title: Text("黄色主题"),
              ),
              body: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.rpx),
                children: [
                  SPGap.largeXX(),
                  SPButton(
                    content: '默认 主色按钮Button',
                    onPressed: () {},
                  ),
                  SPGap.large(),
                  SPButton(
                    content: '黄色主题',
                    style: SPButtonStyle(colorSense: SPColorSense.warning),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return YelloPage();
                      }));
                    },
                  ),
                  SPGap.large(),
                  SPButton(
                    content: 'Button',
                    onPressed: () {},
                    style: SPButtonStyle(buttonType: SPButtonType.secondary),
                  ),
                  SPGap.large(),
                  SPButton(
                    content: 'Button',
                    onPressed: () {},
                    style: SPButtonStyle(colorSense: SPColorSense.error),
                  ),
                  SPGap.large(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SPButton(
                        content: 'Button',
                        onPressed: () {},
                        style: SPButtonStyle(buttonSize: SPButtonSize.small),
                      ),
                      SPButton(
                        content: '按钮',
                        onPressed: () {},
                        style: SPButtonStyle(
                          buttonSize: SPButtonSize.small,
                          buttonType: SPButtonType.secondary,
                        ),
                      ),
                      SPButton(
                        content: '危险',
                        onPressed: () {},
                        style: SPButtonStyle(
                          buttonSize: SPButtonSize.small,
                          buttonType: SPButtonType.secondary,
                          colorSense: SPColorSense.error,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
