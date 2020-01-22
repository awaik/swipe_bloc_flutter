import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group(
    'park-flutter app',
    () {
      final counterTextFinder = find.byValueKey('counterKey');
      final buttonFinder = find.byValueKey('incrementPlusButton');

      FlutterDriver driver;
      setUpAll(() async {
        driver = await FlutterDriver.connect();
      });

      tearDownAll(() async {
        if (driver != null) {
          driver.close();
        }
      });

      test('test init value', () async {
        expect(await driver.getText(counterTextFinder), "1");
      });

      test('test + 1 value after tapped', () async {
        await driver.tap(buttonFinder);
        // Then, verify the counter text is incremented by 1.
        expect(await driver.getText(counterTextFinder), "2");
      });
    },
  );
}
