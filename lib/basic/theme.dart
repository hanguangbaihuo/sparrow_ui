import 'package:flutter/material.dart';
import 'colors.dart';

class SPThemeData {
  /// 主色卡
  MaterialColor primarySwatch = SPColors.blue;

  /// 次色卡
  MaterialColor secondarySwatch = SPColors.gold;

  /// 颜色场景对应的色卡
  Map<SPColorSense, MaterialColor> cSPColorSense = {};

  SPThemeData({
    this.primarySwatch = SPColors.blue,
    this.secondarySwatch = SPColors.gold,
  }) {
    this.cSPColorSense = {
      SPColorSense.primary: primarySwatch,
      SPColorSense.info: SPColors.blue,
      SPColorSense.error: SPColors.red,
      SPColorSense.success: SPColors.green,
      SPColorSense.warning: SPColors.yello,
    };
  }
}

/// 根据我们的theme构建原生的theme
ThemeData buildOriginalThemeData() {
  return ThemeData();
}

class _InheritedTheme extends InheritedTheme {
  const _InheritedTheme({
    Key? key,
    required this.theme,
    required Widget child,
  }) : super(key: key, child: child);

  final SPTheme theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return SPTheme(data: theme.data, builder: (_) => child);
  }

  @override
  bool updateShouldNotify(_InheritedTheme old) => theme.data != old.theme.data;
}

class SPTheme extends StatelessWidget {
  /// Applies the given theme [data] to [child].
  ///
  /// The [data] and [child] arguments must not be null.
  const SPTheme({
    Key? key,
    required this.data,
    required this.builder,
  }) : super(key: key);

  /// Specifies the color and typography values for descendant widgets.
  final SPThemeData data;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final WidgetBuilder builder;

  static final SPThemeData _kFallbackTheme = SPThemeData();

  static SPThemeData of(BuildContext context) {
    final _InheritedTheme? inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedTheme>();
    final MaterialLocalizations? localizations =
        Localizations.of<MaterialLocalizations>(context, MaterialLocalizations);
    final ScriptCategory category =
        localizations?.scriptCategory ?? ScriptCategory.englishLike;
    final SPThemeData theme = inheritedTheme?.theme.data ?? _kFallbackTheme;
    return theme;
    // return SPThemeData.localize(
    //     theme, theme.typography.geometryThemeFor(category));
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedTheme(
      theme: this,
      child: Builder(builder: builder),
    );
  }

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties
  //       .add(DiagnosticsProperty<ThemeData>('data', data, showName: false));
  // }
}

/// Builder to accumulate properties and configuration used to assemble a
/// [DiagnosticsNode] from a [Diagnosticable] object.
class DiagnosticPropertiesBuilder {
  /// Creates a [DiagnosticPropertiesBuilder] with [properties] initialize to
  /// an empty array.
  DiagnosticPropertiesBuilder() : properties = <DiagnosticsNode>[];

  /// Creates a [DiagnosticPropertiesBuilder] with a given [properties].
  DiagnosticPropertiesBuilder.fromProperties(this.properties);

  /// Add a property to the list of properties.
  void add(DiagnosticsNode property) {
    assert(() {
      properties.add(property);
      return true;
    }());
  }

  /// List of properties accumulated so far.
  final List<DiagnosticsNode> properties;

  /// Default style to use for the [DiagnosticsNode] if no style is specified.
  // DiagnosticsTreeStyle defaultDiagnosticsTreeStyle = DiagnosticsTreeStyle.sparse;

  /// Description to show if the node has no displayed properties or children.
  String? emptyBodyDescription;
}
