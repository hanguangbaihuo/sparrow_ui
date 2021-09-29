import 'package:app/common.dart';
import 'package:app/pages/menu/app_menu_page.dart';

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
              // home: MyHomePage(title: 'Sparrow UI Example'),
              home: AppMenuPage(),
            );
          },
        );
      },
    );
  }
}
