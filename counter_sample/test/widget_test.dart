// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:counter_sample/configurations/configurations_screen.dart';
import 'package:counter_sample/model/counter_model.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Dialog test', (WidgetTester tester) async {
    List<CounterModel> counterList = [
      CounterModel(
          counter: 1, isSelected: true, counterNumber: 1, counterTitle: ''),
      CounterModel(
          counter: 1, isSelected: true, counterNumber: 2, counterTitle: '')
    ];

    // Build our app and trigger a frame.
    await tester.pumpWidget(ConfigurationsScreen(
        counterList: counterList));

        final titleFinder = find.text('Counters');

    expect(titleFinder, findsOneWidget);
  });
}
