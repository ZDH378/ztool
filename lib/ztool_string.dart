import 'dart:convert';
import 'dart:math';

///字符串处理工具类
class ZzString {
  /// 把字符串转换为密文字符
  /// [str] 原始字符串
  /// [start] 起始下标，下标从0开始
  /// [len] 要转换的字符数
  static String obscureStr(
      {required String str,
      required int start,
      required int len,
      String single = "*"}) {
    if (str == "null" || str.isEmpty) {
      return "";
    }
    if (start < 0 || start + len > str.length) {
      return str;
    }

    ///生成密文字符串
    StringBuffer obsStr = StringBuffer();
    for (int i = 0; i < len; i++) {
      obsStr.write(single);
    }

    return str.replaceRange(start, start + len, obsStr.toString());
  }

  ///判断APP是否有新版本
  static bool checkAPKNumber(version1, version2) {
    List<String> arr1 = version1.split(".");
    List<String> arr2 = version2.split(".");
    int length = max(arr1.length, arr2.length);
    for (int i = 0; i < length; i++) {
      int n1 = arr1.length > i ? int.parse(arr1[i]) : 0;
      int n2 = arr2.length > i ? int.parse(arr2[i]) : 0;
      if (n1 > n2) return false;
      if (n1 < n2) return true;
    }
    return false;
  }

  ///判断字符串是空的 ""也是空
  ///[str] 需要判断的字符串
  static isEmpty(String? str) {
    return str?.isEmpty ?? true;
  }

  ///判断字符串非空 ""也是空
  ///[str] 需要判断的字符串
  static isNotEmpty(String? str) {
    return str?.isNotEmpty ?? false;
  }

  ///验证手机号是否正确
  ///[str] 手机号码 11位
  static bool isPhoneNum(String str) {
    return RegExp(
            r'^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$')
        .hasMatch(str);
  }

  ///验证身份证号是否正确
  ///[str] 18位身份证号
  static bool isIdCardNum(String str) {
    return RegExp(
            r'^([1-6][1-9]|50)\d{4}(18|19|20)\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$')
        .hasMatch(str);
  }

  ///验证港澳通行证
  /// 规则： H/M + 10位或6位数字
  ///[str] 港澳通行证
  static bool isHKCardNum(String str) {
    return RegExp(r'^([A-Z]\d{6,10}(\(\w{1}\))?)$').hasMatch(str);
  }

  /// 台湾居民来往大陆通行证
  /// 规则： 新版8位或18位数字， 旧版10位数字 + 英文字母
  /// [str] 台湾居民来往大陆通行证
  static bool isTWCardNum(String str) {
    return RegExp(r'^\d{8}|^[a-zA-Z0-9]{10}|^\d{18}$').hasMatch(str);
  }

  /// 护照正则表达式
  /// 规则： 14/15开头 + 7位数字, G + 8位数字, P + 7位数字, S/D + 7或8位数字,等
  ///   /// [str] 护照号
  static bool isPassportNum(String str) {
    return RegExp(r'^([a-zA-z]|[0-9]){5,17}$').hasMatch(str);
  }

  /// 军官证
  /// 规则： 军/兵/士/文/职/广/（其他中文） + "字第" + 4到8位字母或数字 + "号"
  ///   /// [str] 军官证号
  static bool isOfficerCard(String str) {
    return RegExp(r'^[\u4E00-\u9FA5](字第)([0-9a-zA-Z]{4,8})(号?)$').hasMatch(str);
  }

  ///验证是否是邮箱
  static bool isEmail(String str) {
    return RegExp(r'\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$')
        .hasMatch(str);
  }

  ///账号是否合法
  ///规则:字母开头，允许5-16字节，允许字母数字下划线
  static bool isLegalAccent(String str) {
    return RegExp(r'[a-zA-Z][a-zA-Z0-9_]{4,15}$').hasMatch(str);
  }

  ///弱密码
  ///规则:以字母开头，长度在6~18之间，只能包含字母、数字和下划线
  static bool isWeakPwd(String str) {
    return RegExp(r'[a-zA-Z]\w{5,17}$').hasMatch(str);
  }

  ///强密码
  ///规则:必须包含大小写字母和数字的组合，可以使用特殊字符，长度在8-10之间
  static bool isStrongPwd(String str) {
    return RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$').hasMatch(str);
  }

  ///QQ号
  /// QQ号以10000开始
  static bool isQQNum(String str) {
    return RegExp(r'[1-9][0-9]{4,} ').hasMatch(str);
  }

  static bool isPostalCode(String str) {
    return RegExp(r'[1-9]\d{5}(?!\d)').hasMatch(str);
  }

  ///清除所有的空格
  static String cleanAllSpace(String? str) {
    if (ZzString.isEmpty(str)) {
      return "";
    }
    return str!.replaceAll(RegExp(r"\s+\b|\b\s"), "");
  }

  ///字符串转map
  static Map stringtomap(str) {
    if (ZzString.isEmpty(str)) {
      return {};
    }
    try {
      Map map = jsonDecode(str);
      return map;
    } catch (e) {
      return {};
    }
  }
}
