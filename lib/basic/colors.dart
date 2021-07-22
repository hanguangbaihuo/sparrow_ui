import 'package:flutter/material.dart';

/// 将我们定义的色卡转成flutter定义的色卡
/// 我们定义的是从1、2、3、...10，flutter定义的是50、100、200、...900
extension toFlutterColor on MaterialColor {
  MaterialColor get convertToFlutter {
    return MaterialColor(this.value, {
      50: this[1]!,
      100: this[2]!,
      200: this[3]!,
      300: this[4]!,
      400: this[5]!,
      500: this[6]!,
      600: this[7]!,
      700: this[8]!,
      800: this[9]!,
      900: this[10]!,
    });
  }
}

/// 颜色场景
enum PIColorSense {
  /// 主色 primary
  primary,

  /// 信息
  info,

  /// 错误
  error,

  /// 成功
  success,

  /// 警告
  warning,
}

/// 基准色
class PIColors {
  /// 黑色和白色
  static Color black = Color(0xff000000);
  static Color white = Color(0xffffffff);

  static const MaterialColor blue = MaterialColor(0xff2C83F5, {
    1: Color(0xffF0F9FF),
    2: Color(0xffD1EBFF),
    3: Color(0xffA8D7FF),
    4: Color(0xff80BFFF),
    5: Color(0xff57A5FF),
    6: Color(0xff2C83F5),
    7: Color(0xff1B63CF),
    8: Color(0xff0D46A8),
    9: Color(0xff042E82),
    10: Color(0xff021d5c),
  });

  /// 绿色
  static const MaterialColor green = MaterialColor(0xff14C944, {
    1: Color(0xffE6FFE8),
    2: Color(0xffBBFCC4),
    3: Color(0xff8BF09C),
    4: Color(0xff5FE37A),
    5: Color(0xff38D65D),
    6: Color(0xff14C944),
    7: Color(0xff08A337),
    8: Color(0xff007D2A),
    9: Color(0xff005720),
    10: Color(0xff003013),
  });

  /// 红色
  static const MaterialColor red = MaterialColor(0xffFE2D1E, {
    1: Color(0xffFFEFEB),
    2: Color(0xffFFCEC2),
    3: Color(0xffFFAA99),
    4: Color(0xffFF8370),
    5: Color(0xffFF5A47),
    6: Color(0xffFE2D1E),
    7: Color(0xffD9160F),
    8: Color(0xffB30404),
    9: Color(0xff8C0005),
    10: Color(0xff660007),
  });

  /// 黄色
  static const MaterialColor yello = MaterialColor(0xffFFC300, {
    1: Color(0xffFFFDE6),
    2: Color(0xffFFF6A3),
    3: Color(0xffFFED7A),
    4: Color(0xffFFE252),
    5: Color(0xffFFD429),
    6: Color(0xffFFC300),
    7: Color(0xffD99F00),
    8: Color(0xffB37D00),
    9: Color(0xff8C5E00),
    10: Color(0xff664100),
  });

  /// 金色
  static const MaterialColor gold = MaterialColor(0xffFE8700, {
    1: Color(0xffFFF7E6),
    2: Color(0xffFFE0A3),
    3: Color(0xffFFCE7A),
    4: Color(0xffFFBA52),
    5: Color(0xffFFA229),
    6: Color(0xffFE8700),
    7: Color(0xffD96C00),
    8: Color(0xffB35300),
    9: Color(0xff8C3D00),
    10: Color(0xff662900),
  });

  /// 灰色
  static const MaterialColor gray = MaterialColor(0xff919498, {
    1: Color(0xffF5F9FD),
    2: Color(0xffEEF2F6),
    3: Color(0xffE4E8ED),
    4: Color(0xffD4D8DD),
    5: Color(0xffB0B4B8),
    6: Color(0xff919498),
    7: Color(0xff696C70),
    8: Color(0xff55595C),
    9: Color(0xff373A3E),
    10: Color(0xff171A1D),
  });
}

/// 颜色：按照序号从小到大，颜色从浅到深
/// 为了能在左侧显示色值的预览色块，使用Color方式定义颜色。碰到不方便使用的情况再做修改。
class SuiColors {
  /// 黑色和白色
  static Color black = Color(0xff000000);
  static Color white = Color(0xffffffff);

  /// 蓝色
  static Color blue01 = Color(0xffF0F9FF);
  static Color blue02 = Color(0xffD1EBFF);
  static Color blue03 = Color(0xffA8D7FF);
  static Color blue04 = Color(0xff80BFFF);
  static Color blue05 = Color(0xff57A5FF);
  static Color blue06 = Color(0xff2C83F5);
  static Color blue07 = Color(0xff1B63CF);
  static Color blue08 = Color(0xff0D46A8);
  static Color blue09 = Color(0xff042E82);
  static Color blue10 = Color(0xff021d5c);

  /// 绿色
  static Color green01 = Color(0xffE6FFE8);
  static Color green02 = Color(0xffBBFCC4);
  static Color green03 = Color(0xff8BF09C);
  static Color green04 = Color(0xff5FE37A);
  static Color green05 = Color(0xff38D65D);
  static Color green06 = Color(0xff14C944);
  static Color green07 = Color(0xff08A337);
  static Color green08 = Color(0xff007D2A);
  static Color green09 = Color(0xff005720);
  static Color green10 = Color(0xff003013);

  /// 红色
  static Color red01 = Color(0xffFFEFEB);
  static Color red02 = Color(0xffFFCEC2);
  static Color red03 = Color(0xffFFAA99);
  static Color red04 = Color(0xffFF8370);
  static Color red05 = Color(0xffFF5A47);
  static Color red06 = Color(0xffFE2D1E);
  static Color red07 = Color(0xffD9160F);
  static Color red08 = Color(0xffB30404);
  static Color red09 = Color(0xff8C0005);
  static Color red10 = Color(0xff660007);

  /// 黄色
  static Color yellow01 = Color(0xffFFFDE6);
  static Color yellow02 = Color(0xffFFF6A3);
  static Color yellow03 = Color(0xffFFED7A);
  static Color yellow04 = Color(0xffFFE252);
  static Color yellow05 = Color(0xffFFD429);
  static Color yellow06 = Color(0xffFFC300);
  static Color yellow07 = Color(0xffD99F00);
  static Color yellow08 = Color(0xffB37D00);
  static Color yellow09 = Color(0xff8C5E00);
  static Color yellow10 = Color(0xff664100);

  /// 金色
  static Color gold01 = Color(0xffFFF7E6);
  static Color gold02 = Color(0xffFFE0A3);
  static Color gold03 = Color(0xffFFCE7A);
  static Color gold04 = Color(0xffFFBA52);
  static Color gold05 = Color(0xffFFA229);
  static Color gold06 = Color(0xffFE8700);
  static Color gold07 = Color(0xffD96C00);
  static Color gold08 = Color(0xffB35300);
  static Color gold09 = Color(0xff8C3D00);
  static Color gold10 = Color(0xff662900);

  /// 灰色
  static Color gray01 = Color(0xffF5F9FD);
  static Color gray02 = Color(0xffEEF2F6);
  static Color gray03 = Color(0xffE4E8ED);
  static Color gray04 = Color(0xffD4D8DD);
  static Color gray05 = Color(0xffB0B4B8);
  static Color gray06 = Color(0xff919498);
  static Color gray07 = Color(0xff696C70);
  static Color gray08 = Color(0xff55595C);
  static Color gray09 = Color(0xff373A3E);
  static Color gray10 = Color(0xff171A1D);
}
