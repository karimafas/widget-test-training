import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:withu_test_training/components/animations.dart';
import 'package:withu_test_training/services/workout_notifier.dart';

class PickedWorkout extends StatelessWidget {
  const PickedWorkout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutNotifier>(builder: (context, data, index) {
      return data.pickedIndex != -1
          ? SlideYFadeIn(
              slideDuration: 300,
              fadeDuration: 400,
              child: Container(
                width: 200,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.5),
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: Text(
                      'You have chosen:\n' +
                          data.chosenWorkouts[data.pickedIndex].name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                      key: const Key('PickedWorkout')),
                ),
              ),
            )
          : Container(height: 80);
    });
  }
}
