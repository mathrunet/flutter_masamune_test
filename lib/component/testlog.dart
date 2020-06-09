part of masamune.test;

/// Log class for smooth testing.
///
/// After the first new, numbers so that the order is normal with [set(int i)].
///
/// After that, execute [result()] to check the order.
///
/// ```
/// var tester = TestLog();
/// tester.set(1);
/// tester.set(2);
/// tester.set(3);
/// tester.error(); // Execute this if it ends in an error
/// tester.result();
/// ```
class TestLog {
  bool get isDone => this._isDone;
  bool _isDone;
  List<int> _list = List();
  TestLog() {
    this._isDone = false;
  }

  /// Enter the order from 1 in order.
  ///
  /// Not reflected if 0 or less.
  ///
  /// [i]: Order。Not reflected if 0 or less.
  void set(int i) {
    if (i <= 0) return;
    sprintf("[TEST] Sequence: %s at %s", [i, DateTime.now()]);
    this._list.add(i);
  }

  /// Used to wait for test to end.
  ///
  /// Use with async / await.
  ///
  /// ```
  /// void main() {
  ///   test( "test", () async{
  ///     var tester = TestLog();
  ///     ...
  ///     await wait();
  ///   });
  /// }
  /// ```
  Future wait() async {
    while (!this.isDone) await Future.delayed(Duration(milliseconds: 10));
  }

  /// Use when you want to end with an error.
  void error() {
    sprintf("[TEST] Error: %s", [DateTime.now()]);
    this._list.add(-1);
  }

  /// Method to finish and verify the test.
  ///
  /// When testing, make sure to use it where you expect it to end.
  void result() {
    sprintf("[TEST] END: %s", [DateTime.now()]);
    int i = 0;
    this._list.forEach((v) {
      expect(v, i + 1);
      i++;
    });
    this._list.clear();
    this._isDone = true;
  }

  /// Initialize all path data.
  ///
  /// Do it last after dealing with path related data.
  static clear() {}
}
