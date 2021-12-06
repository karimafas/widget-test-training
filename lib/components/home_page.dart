import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:withu_test_training/components/picked_workout.dart';
import 'package:withu_test_training/components/workout_card.dart';
import 'package:withu_test_training/services/workout_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    Provider.of<WorkoutNotifier>(context, listen: false).generateWorkouts();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<WorkoutNotifier>(builder: (context, data, index) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  height: 120,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: data.chosenWorkouts.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return WorkoutCard(
                          workout: data.chosenWorkouts[index], index: index);
                    },
                  )),
              const PickedWorkout()
            ],
          ),
        ),
      );
    }));
  }
}
