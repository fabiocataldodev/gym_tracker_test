import 'package:flutter/material.dart';

class NoListSet extends StatelessWidget {
  const NoListSet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.fitness_center,
            size: 100,
            color: Colors.grey[600],
          ),
          const SizedBox(height: 20),
          Text(
            'No workouts available. Please add some workouts.',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
