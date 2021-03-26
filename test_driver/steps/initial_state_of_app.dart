import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:test/test.dart';

import '../pages/test_home.dart';

StepDefinitionGeneric InitialStateOfApp() {
  return given<FlutterWorld>(
    'I test a initial state of the app',
    (context) async {
      //Instantiate TestHome with FlutterWorld().driver as parameter of Flutter-Driver Object ;
      TestHome testHome = TestHome(context.world.driver);

      // Doing Test..
      context.expectMatch(await testHome.getCounterValue(), '0');
    },
  );
}
