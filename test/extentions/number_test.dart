import 'package:test/test.dart';
import 'package:toolbox/toolbox.dart';

void main() {
  group('NumberExtension', () {
    test('padLeftNumber', () {
      expect(2.padLeftNumber(3), equals('002'));
      expect((-2).padLeftNumber(3), equals('-002'));
      expect(10.padLeftNumber(1), equals('10'));
    });

    test('isBetween', () {
      expect(5.isBetween(1, 10), isTrue);
      expect(5.isBetween(10, 20), isFalse);
      expect(5.isBetween(5, 5), isTrue);
      expect((-5).isBetween(-10, -1), isTrue);
    });
  });
}
