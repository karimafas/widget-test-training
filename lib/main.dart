import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:withu_test_training/components/animations.dart';
import 'package:withu_test_training/components/background.dart';
import 'package:withu_test_training/components/home_page.dart';
import 'package:withu_test_training/services/workout_notifier.dart';

void main() {
  runApp(const MyApp());
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Test Training',
      theme: ThemeData(
        backgroundColor: Colors.black,
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
          create: (_) => WorkoutNotifier(),
          child: Stack(
            children: [
              Container(color: Colors.black.withOpacity(0.85)),
              const FadeIn(delayDuration: 1000, fadeDuration: 3000, child: Background()),
              const HomePage(),
            ],
          )),
    );
  }
}
