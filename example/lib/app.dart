import 'package:app/common.dart';
import 'pages/yello_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SPLayoutWrapper(
      designSize: SPLayoutUtils.designSize,
      builder: () {
        return PITheme(
          data: PIThemeData(),
          builder: (context) {
            final theme = PITheme.of(context);
            final colorScheme = ColorScheme.fromSwatch(
              primarySwatch: theme.primarySwatch.convertToFlutter,
              backgroundColor: PIColors.gray[1],
              cardColor: PIColors.white,
            );
            final flutterThemeData = ThemeData.from(colorScheme: colorScheme);
            return MaterialApp(
              title: 'Sparrow UI Example',
              theme: flutterThemeData,
              home: MyHomePage(title: 'Sparrow UI Example'),
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class CSS {
  static final bigButton = PIButtonStyle(buttonSize: PIButtonSize.big);
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
            style: PIButtonStyle(colorSense: PIColorSense.warning),
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
