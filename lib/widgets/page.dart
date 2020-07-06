import 'package:sparrow_ui/ui.dart';

abstract class SPState<T extends StatefulWidget> extends State
    with WidgetsBindingObserver, RouteAware {
  @protected
  Widget build(BuildContext context);
}

class SPPage extends StatefulWidget {
  SPPage({Key key}) : super(key: key);

  @override
  _SPPageState createState() => _SPPageState();
}

class _SPPageState extends SPState<SPPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
