import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:withu_test_training/components/animations.dart';
import 'package:withu_test_training/components/glass.dart';
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
        child: GlassMorphism(
          start: 0.2,
          end: 0.1,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    widget.workout.name,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                        color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    widget.workout.duration.toString() + ' min',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                        color: Colors.blue, fontSize: 14),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    widget.workout.type,
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 10),
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
