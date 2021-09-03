import 'package:app/common.dart';
import 'pages/dialog_demo.dart';
import 'pages/button_demo.dart';
import 'pages/input_demo.dart';
import 'pages/sliver_demo/sliver_demo.dart';

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
        children: [
          Entry(
            title: '按钮',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return ButtonDemo();
              }));
            },
          ),
          Entry(
            title: '表单元素',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return InputDemo();
              }));
            },
          ),
          Entry(
            title: 'Dialog',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return DialogDemo();
              }));
            },
          ),
          Entry(
            title: 'ListView',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return InputDemo();
              }));
            },
          ),
          Entry(
            title: 'SliverDemo',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return SliverDemo();
              }));
            },
          ),
        ],
      ),
    );
  }
}

class Entry extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const Entry({Key? key, required this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }
}
