import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:withu_test_training/main.dart' as app;
import 'package:withu_test_training/services/maths.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  int listLength = 3;

  group('end-to-end test', () {
    testWidgets('Tap on a workout card, verify result',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify that a number of WorkoutCard widgets are showing; PickedWorkout should not be showing.
      expect(find.byKey(const Key('WorkoutCard')), findsNWidgets(listLength));
      expect(find.byKey(const Key('PickedWorkout')), findsNothing);

      // Tap one of the WorkoutCard widgets.
      Finder workoutCards = find.byKey(const Key('WorkoutCard'));
      await tester.tap(workoutCards.at(Maths.random(0, listLength)));
      await tester.pump();

      // Verify that the PickedWorkout widget is now showing.
      expect(find.byKey(const Key('PickedWorkout')), findsOneWidget);
    });
  });
}
