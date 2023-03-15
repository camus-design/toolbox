extension ListExtension<E> on List<E> {
  Iterable<R> mapIndexed<R>(R Function(E element, int index) convert) sync* {
    for (int i = 0; i < length; i++) {
      yield convert(this[i], i);
    }
  }

  void forEachIndexed(void Function(E element, int index) action) {
    for (int i = 0; i < length; i++) {
      action(this[i], i);
    }
  }
}
