extension EnumExtension on Enum {
  toMap() {
    return name;
  }
}

extension DateTimeExtension on DateTime {
  incode() {
    return toIso8601String();
  }

  decode(value) {
    return DateTime.parse(value);
  }
}
