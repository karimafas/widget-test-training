import 'dart:math';

import 'package:flutter/material.dart';
import 'package:withu_test_training/models/workout.dart';

class WorkoutNotifier extends ChangeNotifier {
  List<Workout> workouts = [
    Workout(name: 'No Limit', type: 'Bodyweight Strength', duration: 28),
    Workout(name: 'Full Body Force', type: 'Bodyweight Strength', duration: 25),
    Workout(name: 'Superset Effect', type: 'Bodyweight Strength', duration: 28),
    Workout(name: 'Outdoor Intervals', type: 'Outdoor Running', duration: 38),
    Workout(name: 'Cardio Burn', type: 'Bodyweight HIIT', duration: 32),
  ];

  List<Workout> chosenWorkouts = [];

  var chosenWorkout;

  random(min, max) {
    var rn = Random();
    return min + rn.nextInt(max - min);
  }

  Workout randomWorkout() {
    int index = random(0, workouts.length);
    return workouts[index];
  }

  generateWorkouts() {
    for (int i = 0; i < 3; i++) {
      chosenWorkouts.add(randomWorkout());
    }
  }

  pickWorkout(index) {
    chosenWorkout = chosenWorkouts[index];
    notifyListeners();
  }
}
