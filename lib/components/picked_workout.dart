import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:withu_test_training/services/workout_notifier.dart';

class PickedWorkout extends StatelessWidget {
  const PickedWorkout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Consumer<WorkoutNotifier>(builder: (context, data, index) {
        return data.chosenWorkout != null
            ? Text('You have chosen:\n' + data.chosenWorkout.name,
                textAlign: TextAlign.center, key: const Key('PickedWorkout'))
            : Container();
      }),
    );
  }
}
