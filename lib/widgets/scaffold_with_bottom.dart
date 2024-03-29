import 'package:sparrow_ui/sparrow_ui.dart';

class PIDoubleScaffold extends StatelessWidget {
  final Scaffold body1;
  final Scaffold body2;
  final bool isOpenSecond;

  const PIDoubleScaffold({
    Key? key,
    required this.body1,
    required this.body2,
    required this.isOpenSecond,
    withPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        body1,
        Positioned(
          top: isOpenSecond ? 0 : MediaQuery.of(context).size.height,
          child: body2,
        ),
      ],
    );
  }
}
