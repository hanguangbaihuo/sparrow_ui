import 'package:app/common.dart';
import 'package:sparrow_ui/widgets/dialog/show_dialog.dart';

class DialogDemo extends StatelessWidget {
  const DialogDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dialog')),
      body: ListView(
        children: [
          PIButton(
            onPressed: () {
              showPIConfirmDialog(context: context);
            },
            content: '删除',
            style: PIButtonStyle(colorSense: PIColorSense.error),
          )
        ],
      ),
    );
  }
}
