import 'package:sparrow_ui/sparrow_ui.dart';

abstract class PIState<T extends StatefulWidget> extends State
    with WidgetsBindingObserver, RouteAware {
  @protected
  Widget build(BuildContext context);
}

class PIPage extends StatefulWidget {
  PIPage({Key? key}) : super(key: key);

  @override
  _PIPageState createState() => _PIPageState();
}

class _PIPageState extends PIState<PIPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
