import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    /* UI IDENTIFICATION MECHANISM : */
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final counterTextFinder = find.byValueKey('counted_number');
    final buttonFinder = find.byValueKey('increment_button');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(counterTextFinder), "0");
    });


    test('Increment the counter', () async {

      // First tap , on the FAB ;
      await driver.tap(buttonFinder);

      // Then , verify text show number '1'
      expect(await driver.getText(counterTextFinder), "1");

      // Second tap , on the FAB ;
      await driver.tap(buttonFinder);

      /*
      //if uncommented  this part of code , test will be fail.
      // verify text show number '3' but this expect is mistake , because actual number is '2'
      expect(await driver.getText(counterTextFinder), "3");
      */

      expect(await driver.getText(counterTextFinder), "2");


    });

  });
}
