import 'dart:math';

import 'package:flutter/material.dart';
import 'package:withu_test_training/models/workout.dart';
import 'package:withu_test_training/services/maths.dart';

class WorkoutNotifier extends ChangeNotifier {
  List<Workout> workouts = [
    Workout(name: 'No Limit', type: 'Bodyweight Strength', duration: 28),
    Workout(name: 'Full Body Force', type: 'Bodyweight Strength', duration: 25),
    Workout(name: 'Superset Effect', type: 'Bodyweight Strength', duration: 28),
    Workout(name: 'Outdoor Intervals', type: 'Outdoor Running', duration: 38),
    Workout(name: 'Cardio Burn', type: 'Bodyweight HIIT', duration: 32),
  ];

  List<Workout> chosenWorkouts = [];

  var pickedIndex = -1;

  Workout randomWorkout() {
    int index = Maths.random(0, workouts.length);
    return workouts[index];
  }

  generateWorkouts() {
    for (int i = 0; i < 3; i++) {
      chosenWorkouts.add(randomWorkout());
    }
  }

  pickWorkout(index) {
    pickedIndex = index;
    notifyListeners();
  }
}
