import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_tracker_test/controller/work_out_controller.dart';
import 'package:gym_tracker_test/screens/work_out_screen.dart';

class WorkoutListScreen extends GetView<WorkoutController> {
  const WorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout List'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.workouts.length,
          itemBuilder: (context, index) {
            final workout = controller.workouts[index];
            return Dismissible(
              key: Key(workout.date.toIso8601String()),
              onDismissed: (direction) => controller.deleteWorkout(index),
              child: ListTile(
                title: Text(workout.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: workout.sets
                      .map((set) => Text(
                          '${set.exercise}: ${set.weight}kg, ${set.reps} reps'))
                      .toList(),
                ),
                onTap: () {
                  Get.to(() => WorkoutScreen(
                        workout: workout,
                        index: index,
                      ));
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.reset();
          Get.to(() => const WorkoutScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
