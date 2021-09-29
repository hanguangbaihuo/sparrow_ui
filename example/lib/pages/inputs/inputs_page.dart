import 'package:app/common.dart';

import 'inputs_widget.dart';

class InputPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> with InputsWidget {
  @override
  void initState() {
    super.initState();
    onInitView();
  }

  @override
  void dispose() {
    super.dispose();
    onDealloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input"),
      ),
      body: renderView(context),
    );
  }
}
