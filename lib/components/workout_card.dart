import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:withu_test_training/components/animations.dart';
import 'package:withu_test_training/models/workout.dart';
import 'package:withu_test_training/services/workout_notifier.dart';

class WorkoutCard extends StatefulWidget {
  const WorkoutCard({
    Key? key,
    required this.workout,
    required this.index,
  }) : super(key: key);

  final Workout workout;
  final int index;

  @override
  State<WorkoutCard> createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<WorkoutCard> {
  @override
  Widget build(BuildContext context) {
    return SlideYFadeIn(
      index: widget.index,
      beginOffsetY: -0.2,
      delayDuration: 200,
      child: GestureDetector(
        key: const Key('WorkoutCard'),
        onTap: () => Provider.of<WorkoutNotifier>(context, listen: false)
            .pickWorkout(widget.index),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 120,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.purpleAccent, Colors.purple]),
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    widget.workout.name,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 1,
                          width: 80,
                          color: Colors.grey.withOpacity(.5)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    widget.workout.type,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    widget.workout.duration.toString() + ' min.',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
