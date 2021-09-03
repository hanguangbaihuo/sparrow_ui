import 'package:sparrow_ui/sparrow_ui.dart';
import 'dialog_layout.dart';

enum PIDialogType {
  /// 基础类型
  basic,

  /// 自定义主体
  customBody,
}

/// 打开对话框时的参数
class PIDialogParams<T> {
  T? params;
}

/// 对话框返回的结果
class PIDialogResult<T> {
  T? result;
}

// 传入参数、返回结果，用户定义返回结果
// 复杂的结果必须用户定义
// 返回结果包含
// - 二次确认是否继续
// - 表单：输入内容，输入内容可能有多个框框、选择框
// - 其他
// 暂时不考虑多个底部按钮，目前可以为一个或两个

// 可以封装一些常用的简单操作

// 比如confirm，返回true或false

Future<bool> showPIConfirmDialog({
  required BuildContext context,
}) async {
  var res = await showPIDialog<bool>(
    context: context,
    title: '再次确认',
    confirmText: '删除',
    cancelText: '保留',
    content: '您确定要删除这条数据吗',
  );
  return res ?? false;
}

/// P 参数类型
/// R 返回结果类型
showPIDialogBuilder<P, R>({
  /// 构建标题
  String Function(P params)? titleBuilder,
  Widget Function(P params)? titleWidgetBuilder,

  /// 构建内容
  String Function(P params)? contentBuilder,
  Widget Function(P params)? contentWidgetBuilder,
}) {}

/**
 * 
 * showPIDialog<T, P>(
 *  context: context,
 *  title: '',
 *  params: Params(),
 *  contentBuilder: (P params) {
 *    // 构建主体
 *  },
 *  
 * );
 */

/// 显示弹窗
Future<T?> showPIDialog<T>({
  required BuildContext context,
  bool barrierDismissible = false,
  Key? key,
  Widget? titleWidget,
  String? title,
  Widget? contentWidget,
  String? content,
  TextAlign contentAlign = TextAlign.center,
  Widget? extra,
  String? cancelText,
  Function? cancelTap,
  String? confirmText,
  ConfirmColors confirmTextColor = ConfirmColors.warn,
  Function? confirmTap,
  bool isPopDialogOnClickCancel = true,
  bool disableButtons = false,
  double? width,
  double? maxHeight,
  double? minHeight,
  bool isShowCancel = true,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return PIDialogLayout(
        key: key,
        title: title,
        titleWidget: titleWidget,
        content: content,
        contentAlign: contentAlign,
        contentWidget: contentWidget,
        extra: extra,
        cancelText: cancelText,
        cancelTap: cancelTap,
        confirmText: confirmText,
        confirmTextColor: confirmTextColor,
        confirmTap: confirmTap,
        isPopDialogOnClickCancel: isPopDialogOnClickCancel,
        disableButtons: disableButtons,
        width: width,
        maxHeight: maxHeight,
        minHeight: minHeight,
        isShowCancel: isShowCancel,
      );
    },
  );
}

// 弹窗
// 是用到路由的，打开新的页面showDialog，关闭弹窗要用Navigator.pop
// 布局：标题、主体、底部按钮
// confirm
// alert
// 带状态的弹窗，组件主体内容是可以变化的，点击按钮时需要拿到内容并返回。
// onConfirm(xxx) {处理状态并返回}

// 有状态的弹窗
class PIDialogStateful extends StatefulWidget {
  PIDialogStateful({Key? key}) : super(key: key);

  @override
  _PIDialogStatefulState createState() => _PIDialogStatefulState();
}

class _PIDialogStatefulState extends State<PIDialogStateful> {
  @override
  Widget build(BuildContext context) {
    // 返回输入框
    // 当点击按钮时，从此状态组件中读取内容返回结果
    return PIDialogLayout();
  }
}

/// 无状态弹窗
class PIDialogStateless extends StatelessWidget {
  const PIDialogStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}

// 有状态弹窗和无状态弹窗 使用弹窗布局渲染弹窗

/// 弹窗主体
class PIDialogContent extends StatelessWidget {
  const PIDialogContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
