import 'package:flutter_driver/flutter_driver.dart';

class TestHome{
  final counterTextFinder = find.byValueKey('counted_number');
  final buttonAdd= find.byValueKey('increment_button');
  final buttonSubtract= find.byValueKey('decrement_button');
  final alertDialogText= find.byValueKey('alert_text');
  final buttonClose= find.byValueKey('close_button');

  FlutterDriver _driver;
  TestHome(FlutterDriver driver){
    this._driver=driver;
  }




  Future<String> getCounterValue()async{
    return await _driver.getText(counterTextFinder);
  }

}