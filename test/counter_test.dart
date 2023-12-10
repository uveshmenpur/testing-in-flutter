
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_in_flutter/counter.dart';

/// We nee to use '_test' as a suffix
/// so that dart compiler can recognize that this is a test file
/// If you don't write '_test' dart will simply ignore those files

void main(){

  /// This Function is provided by flutter test package
  /// In the body of this text we can write a single test
  /// and we provide the description to this test
  /// In the first parameter we pass the description of the test that we are writing
  /// This description should be in the format of [Given - When - Then]
  test(
      'Given the counter class when it is instantiated the value of the counter variable should be 0',
      ///In this body function we write our tests
      (){
        /// First we "Arrange" what component or variables that we need [This is the Given part]
        final counter = Counter();
        /// Than We "Act" [This is When Part]
        final num = counter.counter;
        /// And finally we "Assert" [This is Then Part]
        expect(num, 0); /// Expect functin is provided by test library this function basically compares two values given by us
  });
}