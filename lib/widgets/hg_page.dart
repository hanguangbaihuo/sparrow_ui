import 'package:sparrow_ui/ui.dart';

abstract class HGState<T extends StatefulWidget> extends State
    with WidgetsBindingObserver, RouteAware {
  @protected
  Widget build(BuildContext context);
}

class HGPage extends StatefulWidget {
  HGPage({Key key}) : super(key: key);

  @override
  _HGPageState createState() => _HGPageState();
}

class _HGPageState extends HGState<HGPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
