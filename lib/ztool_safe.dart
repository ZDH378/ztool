/// 判断对象是否为空
bool $empty(Object? obj) {
  if (obj == null) return true;

  if (obj is String && (obj.isEmpty || obj == "")) {
    return true;
  } else if (obj is List && (obj.isEmpty || obj.length < 1)) {
    return true;
  } else if (obj is Map && (obj.isEmpty || obj.length < 1)) {
    return true;
  }

  return false;
}

/// 判断对象不为空
bool $notempty(Object? obj) {
  return !$empty(obj);
}

/// 取字符串,保证结果一定是字符串
String $string(Object? value) {
  if (value == null) {
    return '';
  } else {
    if (value is String) {
      return value;
    } else {
      return value.toString();
    }
  }
}

/// 取数组,保证结果一定是数组
List $list(Object? value) {
  if (value == null) {
    return [];
  } else {
    if (value is List) {
      return value;
    } else {
      return [];
    }
  }
}
