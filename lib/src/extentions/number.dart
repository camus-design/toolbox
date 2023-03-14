extension NumberExtentions on num {
  String padLeftNumber(num number, int length, {String pad = '0'}) {
    return number.toString().padLeft(length, pad);
  }

  bool isBetween(num min, num max) {
    return this >= min && this <= max;
  }
}
