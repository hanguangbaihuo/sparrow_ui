import 'package:app/common.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SPLayoutWrapper(
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          SPGap.largeXX(),
          SPButton(content: 'Button'),
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
