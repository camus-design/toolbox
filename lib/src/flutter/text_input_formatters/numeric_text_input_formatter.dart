import 'package:flutter/services.dart';

/// A [TextInputFormatter] that formats numeric values within a given range.
///
/// This formatter limits the input to a maximum of [maxIntegerDigits] digits
/// before the decimal point and [maxDecimalPlaces] digits after it. It also
/// ensures that the input value is within the range defined by [minValue] and
/// [maxValue]. If the input is outside of this range, it is automatically
/// corrected to the nearest boundary value.
///

class NumericTextInputFormatter extends TextInputFormatter {
  /// Creates a new instance of [NumericRangeTextInputFormatter].
  ///
  /// The [minValue] parameter specifies the minimum allowed value. The default
  /// value is [double.negativeInfinity], which means that there is no minimum
  /// limit.
  ///
  /// The [maxValue] parameter specifies the maximum allowed value. The default
  /// value is [double.infinity], which means that there is no maximum limit.
  ///
  /// The [maxIntegerDigits] parameter specifies the maximum number of digits
  /// allowed before the decimal point. The default value is 10.
  ///
  /// The [maxDecimalPlaces] parameter specifies the maximum number of digits
  /// allowed after the decimal point. The default value is 2.
  NumericTextInputFormatter({
    this.minValue = double.negativeInfinity,
    this.maxValue = double.infinity,
    this.maxIntegerDigits = 10,
    this.maxDecimalPlaces = 0,
  });

  /// The minimum allowed value.
  final double minValue;

  /// The maximum allowed value.
  final double maxValue;

  /// The maximum number of digits allowed before the decimal point.
  final int maxIntegerDigits;

  /// The maximum number of digits allowed after the decimal point.
  final int maxDecimalPlaces;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final RegExp regExp = RegExp('^\\d*\\.?\\d{0,$maxDecimalPlaces}\$');

    if (regExp.hasMatch(newValue.text) &&
        newValue.text.split('.').first.length <= maxIntegerDigits &&
        newValue.text.split('.').last.length <= maxDecimalPlaces) {
      final double value = double.parse(newValue.text);

      if (value < minValue) {
        return TextEditingValue(
          text: minValue.toString(),
          selection:
              TextSelection.collapsed(offset: minValue.toString().length),
        );
      }

      if (value > maxValue) {
        return TextEditingValue(
          text: maxValue.toString(),
          selection:
              TextSelection.collapsed(offset: maxValue.toString().length),
        );
      }

      return newValue;
    }

    return oldValue;
  }
}
