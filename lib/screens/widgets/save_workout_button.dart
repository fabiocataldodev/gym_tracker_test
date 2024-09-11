import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_tracker_test/app_config/styles.dart';
import 'package:gym_tracker_test/controller/work_out_controller.dart';
import 'package:gym_tracker_test/models/workout_model.dart';

class SaveWorkoutButton extends GetView<WorkoutController> {
  final int? index;

  const SaveWorkoutButton({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.8,
      child: ElevatedButton(
        style: ButtonStyles.primaryButtonStyle(),
        onPressed: () {
          if (controller.sets.isEmpty) {
            Get.snackbar(
              'Empty List',
              'Please add at least one exercise to the workout before saving.',
            );
            return;
          }

          final title = controller.titleController.text.isNotEmpty
              ? controller.titleController.text
              : 'No Title';
          final workout = Workout(
            sets: controller.sets.toList(),
            date: DateTime.now(),
            title: title,
          );

          if (index != null) {
            controller.updateWorkout(index!, workout);
          } else {
            controller.addWorkout(workout);
          }

          Get.back();
        },
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Save Workout',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
