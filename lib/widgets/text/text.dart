import 'package:sparrow_ui/sparrow_ui.dart';

class PIText extends StatelessWidget {
  final String data;
  const PIText(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}
