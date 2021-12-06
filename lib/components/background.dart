import 'package:flutter/material.dart';
import 'package:withu_test_training/components/background_sphere.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          BackgroundSphere(
            size: 200,
            beginColor: Colors.red,
            endColor: Colors.orange,
            alignment: MainAxisAlignment.center,
          ),
          BackgroundSphere(
            size: 80,
            beginColor: Colors.blue,
            endColor: Colors.purple,
            alignment: MainAxisAlignment.start,
          ),
          BackgroundSphere(
            size: 120,
            beginColor: Colors.green,
            endColor: Colors.yellow,
            alignment: MainAxisAlignment.end,
          )
        ],
      ),
    );
  }
}
