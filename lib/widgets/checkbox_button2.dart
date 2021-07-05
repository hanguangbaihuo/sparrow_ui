import 'package:sparrow_ui/sparrow_ui.dart';

import './button.dart';

final _uncheckedDecoration = BoxDecoration(
  // color: Color.fromRGBO(245, 245, 245, 1),
  color: Colors.white,

  borderRadius: BorderRadius.all(Radius.circular(10.rpx)),
);

final _checkedDecoration = BoxDecoration(
  // color: Colors.white,
  color: Color.fromRGBO(248, 47, 63, 0.08),
  borderRadius: BorderRadius.all(Radius.circular(10.rpx)),

  border: Border.all(
    color: Color.fromRGBO(248, 47, 63, 1),
    width: 2.rpx,
  ),
);

// class SPCheckboxButton2 extends StatelessWidget {
//   final String content;
//   final bool checked;
//   final Function onTap;
//   final double? width;

//   const SPCheckboxButton2({
//     Key? key,
//     required this.content,
//     required this.checked,
//     required this.onTap,
//     this.width,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       decoration: checked ? _checkedDecoration : _uncheckedDecoration,
//       child: SPButton60(
//         onTap: onTap,
//         width: width,
//         content: content,
//         contentColor: checked ? Color.fromRGBO(248, 47, 63, 1) : Color.fromRGBO(33, 37, 41, 1),
//         color: checked ? Color.fromRGBO(248, 47, 63, 0.08) : Color.fromRGBO(245, 245, 245, 1),
//       ),
//     );
//   }
// }
