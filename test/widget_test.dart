import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:withu_test_training/main.dart';
import 'package:withu_test_training/services/maths.dart';

void main() {
  int listLength = 3;

  testWidgets('WorkoutCard tap makes PickedWorkout appear',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

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
}
