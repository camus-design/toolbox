import 'package:flutter_test/flutter_test.dart';
import 'package:toolbox/toolbox.dart';

void main() {
  test('should format numeric values within range', () {
    final NumericTextInputFormatter formatter = NumericTextInputFormatter(
      minValue: 0,
      maxValue: 100,
      maxIntegerDigits: 3,
      maxDecimalPlaces: 2,
    );
    const TextEditingValue oldValue = TextEditingValue(text: '50.00');
    const TextEditingValue newValue = TextEditingValue(text: '150.00');

    final TextEditingValue result =
        formatter.formatEditUpdate(oldValue, newValue);

    expect(result.text, '100.00');
    expect(result.selection.baseOffset, result.text.length);
  });

  test('should not allow non-numeric characters', () {
    final NumericTextInputFormatter formatter = NumericTextInputFormatter();
    const TextEditingValue oldValue = TextEditingValue(text: '');
    const TextEditingValue newValue = TextEditingValue(text: 'ABC123');

    final TextEditingValue result =
        formatter.formatEditUpdate(oldValue, newValue);

    expect(result.text, '');
    expect(result.selection.baseOffset, 0);
  });

  test('should not allow more than the maximum integer digits', () {
    final NumericTextInputFormatter formatter =
        NumericTextInputFormatter(maxIntegerDigits: 4);
    const TextEditingValue oldValue = TextEditingValue(text: '1234');
    const TextEditingValue newValue = TextEditingValue(text: '12345');

    final TextEditingValue result =
        formatter.formatEditUpdate(oldValue, newValue);

    expect(result.text, '1234');
    expect(result.selection.baseOffset, result.text.length);
  });

  test('should not allow more than the maximum decimal places', () {
    final NumericTextInputFormatter formatter =
        NumericTextInputFormatter(maxDecimalPlaces: 2);
    const TextEditingValue oldValue = TextEditingValue(text: '12.34');
    const TextEditingValue newValue = TextEditingValue(text: '12.345');

    final TextEditingValue result =
        formatter.formatEditUpdate(oldValue, newValue);

    expect(result.text, '12.34');
    expect(result.selection.baseOffset, result.text.length);
  });
}
