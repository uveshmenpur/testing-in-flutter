import 'package:flutter_test/flutter_test.dart';
import 'package:testing_in_flutter/unit_test/counter.dart';

/// We nee to use '_test' as a suffix
/// so that dart compiler can recognize that this is a test file
/// If you don't write '_test' dart will simply ignore those files

void main() {
  /// This Function is provided by flutter test package
  /// In the body of this text we can write a single test
  /// and we provide the description to this test
  /// In the first parameter we pass the description of the test that we are writing
  /// This description should be in the format of [Given - When - Then]


  /// Called once  before every test (called 3 times if 3 tests)
  /// Setup -> Test1 -> Setup -> Test2 -> Setup -> Test3
  setUp(() => null);
  /// Called once before all tests
  /// SetupAll -> Test1 -> Test2 -> Test3
  setUpAll(() => null);
  /// Called once after every test (called 3 times if 3 tests)
  /// Test1 -> TearDown -> Test2 -> TearDown -> Test3  -> TearDown
  tearDown(() => null);
  /// Called once after all the tests are done
  /// Test1 -> Test2 -> Test3 -> TearDownAll
  tearDownAll(() => null);



  late Counter counter;
  /// using this function new counter will be created everytime a test is run
  setUp((){
    counter = Counter();
  });
  /// Group Function is used to group multiple tests together
  /// By Grouping multiple tests we can use the variables defined in group in all the tests
  group('Counter Test - ', () {
    /// First we "Arrange" what component or variables that we need [This is the Given part]
    test(
        'Given the counter class when it is instantiated the value of the counter variable should be 0',

        ///In this body function we write our tests
            () {

          /// Than We "Act" [This is When Part]
          final num = counter.counter;

          /// And finally we "Assert" [This is Then Part]
          expect(num, 0);

          /// Expect function is provided by test library this function basically compares two values given by us
        });
    test(
        'Given the counter class when it is incremented the value of the counter variable should be 1',
            () {
          counter.increment();
          final num = counter.counter;
          expect(num, 1);
        });

    /// All tests should be independent of each other
    test(
        'Given the counter class when it is decremented the value of the counter variable should be -1',
            () {
          counter.decrement();
          final num = counter.counter;
          expect(num, -1);
        });
  });
}
