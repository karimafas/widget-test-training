import 'package:test/test.dart';
import 'package:withu_test_training/services/workout_notifier.dart';

void main() {
  test(
      'On app start, chosenWorkouts should populate and no two workouts should be the same',
      () {
    final workoutNotifier = WorkoutNotifier();

    // On app start, 3 workouts get picked randomly.
    workoutNotifier.generateWorkouts();

    expect(workoutNotifier.chosenWorkouts.length, 3);

    // Verify each workout only appears once in chosenWorkouts.
    for (final workout in workoutNotifier.chosenWorkouts) {
      var occurrencies = 0;

      for (int i = 0; i < workoutNotifier.chosenWorkouts.length; i++) {
        if (workoutNotifier.chosenWorkouts[i] == workout) {
          occurrencies++;
        }
      }

      expect(occurrencies, 1);
    }
  });
}
