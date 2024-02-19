class Range<N extends num> {
  final N start;
  final N end;

  Range(this.start, this.end);

  bool contains(N value) {
    return start.compareTo(value) <= 0 && value.compareTo(end) <= 0;
  }

  static Range<N> closed<N extends num>(N start, N end) {
    return Range(start, end);
  }
}
