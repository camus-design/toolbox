/// Provides extension methods for the `List` class.
extension ListExtension<E> on List<E> {
  /// Returns a new iterable where each element is the result of applying the given
  /// [convert] function to the corresponding element and its index.
  ///
  /// The returned iterable is lazy, and its values are computed on-demand.
  ///
  /// Example:
  ///
  /// ```dart
  /// final fruits = ['apple', 'banana', 'cherry'];
  ///
  /// final indexedFruits = fruits.mapIndexed((fruit, index) => '$index: $fruit');
  ///
  /// print(indexedFruits.toList()); // [0: apple, 1: banana, 2: cherry]
  /// ```
  Iterable<R> mapIndexed<R>(R Function(E element, int index) convert) sync* {
    for (int i = 0; i < length; i++) {
      yield convert(this[i], i);
    }
  }

  /// Executes the given [action] on each element and its index in the list.
  ///
  /// Example:
  ///
  /// ```dart
  /// final fruits = ['apple', 'banana', 'cherry'];
  ///
  /// fruits.forEachIndexed((fruit, index) => print('$index: $fruit'));
  ///
  /// // Output:
  /// // 0: apple
  /// // 1: banana
  /// // 2: cherry
  /// ```
  void forEachIndexed(void Function(E element, int index) action) {
    for (int i = 0; i < length; i++) {
      action(this[i], i);
    }
  }
}
