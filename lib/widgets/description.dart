import 'package:sparrow_ui/ui.dart';

final fontSize = 30.rpx;

class SPDescribeContainer extends StatelessWidget {
  final Widget? child;
  final double? paddingSize;
  const SPDescribeContainer({
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

class SPDescribeItem extends StatelessWidget {
  final String? field;
  final String? value;
  final double? paddingSize;

  const SPDescribeItem({Key? key, this.field, this.value, this.paddingSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SPDescribeContainer(
      paddingSize: paddingSize,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: SPDescribeFieldText('$field：'), flex: 0),
            Expanded(
              child: SPDescribeValueText('$value'),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class SPTitleText extends Text {
  SPTitleText(
    String content,
  ) : super(
          content,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: rgba(33, 37, 41, 1),
          ),
        );
}

class SPDescribeFieldText extends Text {
  SPDescribeFieldText(
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
            color: rgba(127, 127, 127, 1),
          ),
        );
}

class SPDescribeValueText extends Text {
  SPDescribeValueText(
    String content,
  ) : super(
          content,
          style: TextStyle(
            height: 42 / 30,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: rgba(33, 37, 41, 1),
          ),
          maxLines: 2,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        );
}

class SPMoneyText extends Text {
  SPMoneyText(
    String content,
  ) : super(
          content,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: rgba(248, 47, 63, 1),
          ),
        );
}
