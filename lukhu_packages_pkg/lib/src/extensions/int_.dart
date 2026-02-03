extension IntExtension on int {
  List<int> upTo(int maxInclusive, {int stepSize = 1}) =>
      [for (int i = this; i <= maxInclusive; i += stepSize) i];
  String enableLeadingZero() {
    if (this > 9) return toString();
    return '0$this';
  }
}
