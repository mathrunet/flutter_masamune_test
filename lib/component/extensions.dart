part of masamune.test;

/// Test class extension methods.
extension TestExtension on Object {
  /// Extension method that can execute [expect].
  ///
  /// [matcher]: The object to compare with.
  /// [reason]: Reason.
  /// [skip]: Skip.
  void are(dynamic matcher, {dynamic reason, dynamic skip}) {
    expect(this, matcher, reason: reason, skip: skip);
  }

  /// Verify if value is null.
  ///
  /// [reason]: Reason.
  /// [skip]: Skip.
  void areNull({dynamic reason, dynamic skip}) {
    expect(this, null, reason: reason, skip: skip);
  }
}
