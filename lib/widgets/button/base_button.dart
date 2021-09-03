/// 基础按钮

import 'package:sparrow_ui/sparrow_ui.dart';

class PIBaseButton extends StatelessWidget {
  final String content;
  final GestureTapCallback onPressed;
  final IconData? icon;
  final List<ButtonStyle>? styles;

  const PIBaseButton({
    Key? key,
    required this.content,
    required this.onPressed,
    this.styles,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (icon == null) {
      return TextButton(
        onPressed: onPressed,
        child: _renderText(),
        style: _renderStyle(context),
      );
    } else {
      return TextButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: _renderText(),
        style: _renderStyle(context),
      );
    }
  }

  ButtonStyle? _renderStyle(BuildContext context) {
    if (styles == null || styles!.isEmpty) return null;
    // 默认button style
    final defaultStyle = Theme.of(context).textButtonTheme.style;
    var result = defaultStyle ?? ButtonStyle();
    for (var style in styles!) {
      result = result.merge(style);
    }
    return result;
  }

  Widget _renderText() {
    return Text(
      content,
      maxLines: 1,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      // style: style?.textStyle,
    );
  }
}
