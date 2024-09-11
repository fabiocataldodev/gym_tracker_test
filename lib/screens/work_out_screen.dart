import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_tracker_test/app_config/app_colors.dart';
import 'package:gym_tracker_test/app_config/styles.dart';
import 'package:gym_tracker_test/controller/work_out_controller.dart';
import 'package:gym_tracker_test/screens/widgets/custom_input_textfield.dart';
import 'package:gym_tracker_test/screens/widgets/dropdown_itens.dart';
import 'package:gym_tracker_test/screens/widgets/save_workout_button.dart';
import 'package:gym_tracker_test/screens/widgets/set_list.dart';
import '../models/workout_model.dart';

class WorkoutScreen extends StatelessWidget {
  final Workout? workout;
  final int? index;

  const WorkoutScreen({super.key, this.workout, this.index});

  @override
  Widget build(BuildContext context) {
    final WorkoutController controller = Get.find();

    if (workout != null) {
      if (controller.sets.isEmpty) {
        controller.sets.value = workout!.sets;
      }
      controller.titleController.text = workout!.title;
    }

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        title: Text(workout == null ? 'New Workout' : 'Edit Workout'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: controller.titleController,
                decoration: customInputDecoration(
                  labelText: 'Enter your workout title',
                  hintText: '',
                ),
              ),
            ),
            DropdownItens(),
            Row(
              children: [
                CustomInputTextfield(
                  controller: controller.weightController,
                  labelText: 'Weight (kg)',
                ),
                CustomInputTextfield(
                  controller: controller.repsController,
                  labelText: 'Repetitions',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ButtonStyles.primaryButtonStyle(),
                  onPressed: controller.addSet,
                  child: const Text(
                    'Add Set',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SetList(),
            SaveWorkoutButton(index: index),
          ],
        ),
      ),
    );
  }
}
