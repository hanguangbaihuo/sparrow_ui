import 'package:sparrow_ui/sparrow_ui.dart';

/// 用于定义弹框确认按钮的文本颜色
enum ConfirmColors {
  /// 警告，为红色
  warn,

  /// 主要颜色，为蓝色
  primary,
}

/// 弹框中，“确认”文本的颜色，目前仅提供两种
Map<ConfirmColors, Color> _confirmTextColors = {
  ConfirmColors.warn: PIColors.red,
  ConfirmColors.primary: PIColors.blue,
};

/// 弹窗
///
/// 确认，选择等
class PIDialogLayout extends StatelessWidget {
  PIDialogLayout({
    Key? key,
    this.title,
    this.titleText,
    this.content,
    this.contentText,
    this.contentTextAlign = TextAlign.center,
    this.extra,
    this.cancelText,
    this.cancelTap,
    this.confirmText,
    this.confirmTextColor = ConfirmColors.warn,
    this.confirmTap,
    this.isPopDialogOnClickCancel = true,
    this.disableButtons = false,
    this.width,
    this.maxHeight,
    this.minHeight,
    this.isShowCancel = true,
  }) : super(key: key);

  /// Widget标题
  final Widget? title;

  /// 文本标题
  /// 如果指定文本标题，使用通用文本标题，否则使用[title]的widget作为标题
  final String? titleText;

  /// Widget 内容主体
  final Widget? content;

  /// 文本 内容主体
  /// 如果指定[contentText]文本主体，使用通用文本主体，否则使用[content]的widget作为主体
  final String? contentText;

  /// contentText的align方式
  final TextAlign contentTextAlign;

  /// 位于主体内容下，按钮上方的widget
  final Widget? extra;

  /// 禁用所有的按钮
  final bool disableButtons;

  final double? width;

  /// content 的最大高度，超出后有滚动条，默认值300.rpx
  final double? maxHeight;

  /// content 设置最小高度
  final double? minHeight;

  /// 取消按钮的文字
  final String? cancelText;

  /// 点击取消按钮之后的回调
  final Function? cancelTap;

  /// 确认按钮的文字
  final String? confirmText;

  /// 点击确认按钮之后的回调
  final Function? confirmTap;

  // 用于设置确认按钮的文本颜色
  final ConfirmColors confirmTextColor;

  /// 点击取消按钮，关闭dialog，默认开启
  final bool isPopDialogOnClickCancel;

  /// 是否展示取消按钮
  final bool isShowCancel;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      constrainedAxis: Axis.vertical,
      child: SizedBox(
        width: width ?? 590.rpx,
        child: Dialog(
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: PIBorderRadius.big),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // title
                _renderTitle(),

                // content
                Container(
                  padding: EdgeInsets.only(
                    left: 32.rpx,
                    right: 32.rpx,
                    top: 24.rpx,
                    bottom: 24.rpx,
                  ),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: maxHeight ?? 300.rpx,
                      minHeight: minHeight ?? 100.rpx,
                    ),
                    child: SingleChildScrollView(
                      child: _renderContent(),
                    ),
                  ),
                ),

                // extra
                Container(child: extra),

                // button分割线
                Container(
                  height: 1.rpx,
                  color: Color(0xffd9d9d9),
                ),

                // button
                Opacity(
                  opacity: disableButtons ? 0.4 : 1,
                  child: isShowCancel == false
                      ? _renderConfirmButton(context)
                      : _renderButtons(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderTitle() {
    /// 如果指定文本标题，使用通用文本标题，否则使用[title]的widget作为标题
    if (titleText != null) {
      return Container(
        margin: EdgeInsets.only(
          top: 80.rpx,
          right: 57.rpx,
          left: 57.rpx,
        ),
        height: 44.rpx,
        child: Text(
          '$titleText',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff000000),
            fontSize: 34.rpx,
            height: 1,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(top: 50.rpx, bottom: 25.rpx),
        child: title,
      );
    }
  }

  Widget _renderContent() {
    /// 如果指定[contentText]文本主体，使用通用文本主体，否则使用[content]的widget作为主体
    if (contentText != null) {
      return Text(
        '$contentText',
        textAlign: contentTextAlign,
        style: TextStyle(
          color: PIColors.gray[3],
          fontSize: 28.rpx,
        ),
      );
    } else {
      return Container(
        child: content,
      );
    }
  }

  /// 渲染两个操作按钮
  Widget _renderButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _renderCancelButton(context),
        ),
        Container(
          width: 1.rpx,
          height: 94.rpx,
          color: Color(0xffd9d9d9),
        ),
        Expanded(
          child: _renderConfirmButton(context),
        ),
      ],
    );
  }

  /// 取消按钮
  Widget _renderCancelButton(BuildContext context) {
    return InkWell(
      child: Container(
        height: 94.rpx,
        child: Text(
          cancelText != null ? cancelText! : "取消",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff8b8b8b),
            fontSize: 32.rpx,
            height: 74 / 32,
          ),
        ),
      ),
      onTap: () {
        if (disableButtons) return;

        ///移除键盘
        FocusScope.of(context).requestFocus(new FocusNode());
        if (cancelTap != null) {
          cancelTap!();
        }

        if (isPopDialogOnClickCancel) {
          Navigator.of(context).pop();
        }
      },
    );
  }

  /// 确认按钮
  Widget _renderConfirmButton(BuildContext context) {
    return InkWell(
      child: Container(
        height: 94.rpx,
        child: Text(
          confirmText != null ? confirmText! : "确定",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _confirmTextColors[confirmTextColor],
            fontSize: 32.rpx,
            height: 74 / 32,
          ),
        ),
      ),
      onTap: () {
        if (disableButtons) return;

        ///移除键盘
        FocusScope.of(context).requestFocus(new FocusNode());
        if (confirmTap != null) {
          confirmTap!();
        }
      },
    );
  }
}
