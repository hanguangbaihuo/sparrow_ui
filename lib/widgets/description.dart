import 'package:sparrow_ui/sparrow_ui.dart';

final fontSize = 30.rpx;

class PIDescribeContainer extends StatelessWidget {
  final Widget? child;
  final double? paddingSize;
  const PIDescribeContainer({
    Key? key,
    this.child,
    this.paddingSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: paddingSize ?? 15.rpx),
      child: child,
    );
  }
}

class PIDescribeItem extends StatelessWidget {
  final String? field;
  final String? value;
  final double? paddingSize;

  const PIDescribeItem({Key? key, this.field, this.value, this.paddingSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PIDescribeContainer(
      paddingSize: paddingSize,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: PIDescribeFieldText('$field：'), flex: 0),
            Expanded(
              child: PIDescribeValueText('$value'),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class PITitleText extends Text {
  PITitleText(
    String content,
  ) : super(
          content,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(33, 37, 41, 1),
          ),
        );
}

class PIDescribeFieldText extends Text {
  PIDescribeFieldText(
    String content,
  ) : super(
          content,
          overflow: TextOverflow.fade,
          softWrap: false,
          maxLines: 1,
          style: TextStyle(
            fontSize: fontSize,
            height: 42 / 30,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(127, 127, 127, 1),
          ),
        );
}

class PIDescribeValueText extends Text {
  PIDescribeValueText(
    String content,
  ) : super(
          content,
          style: TextStyle(
            height: 42 / 30,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(33, 37, 41, 1),
          ),
          maxLines: 2,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        );
}

class PIMoneyText extends Text {
  PIMoneyText(
    String content,
  ) : super(
          content,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(248, 47, 63, 1),
          ),
        );
}
