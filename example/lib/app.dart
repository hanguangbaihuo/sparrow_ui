import 'package:app/common.dart';
import 'pages/yello_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SPLayoutWrapper(
      designSize: SPLayoutUtils.designSize,
      builder: () {
        return SPTheme(
          data: SPThemeData(),
          builder: (context) {
            final theme = SPTheme.of(context);
            final colorScheme = ColorScheme.fromSwatch(
              primarySwatch: theme.primarySwatch.convertToFlutter,
              backgroundColor: SPColors.gray[1],
              cardColor: SPColors.white,
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
  static final bigButton = SPButtonStyle(buttonSize: SPButtonSize.big);
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
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
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
