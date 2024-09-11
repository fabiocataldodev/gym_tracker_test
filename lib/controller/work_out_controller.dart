import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/workout_model.dart';
import '../services/storage_service.dart';

class WorkoutController extends GetxController {
  var workouts = <Workout>[].obs;
  var sets = <SetModel>[].obs;
  final selectedExercise = 'Barbell row'.obs;
  final TextEditingController weightController = TextEditingController();
  final TextEditingController repsController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  final StorageService _storageService = StorageService();

  @override
  void onInit() {
    super.onInit();
    workouts.value = _storageService.getWorkouts();
  }

  void addSet() {
    final weight = double.tryParse(weightController.text);
    final reps = int.tryParse(repsController.text);
    final title = titleController.text;

    if (weight == null || reps == null || weight <= 0 || reps <= 0) {
      Get.snackbar('Error',
          'Weight and reps must be valid numbers and greater than zero.');
      return;
    }

    sets.add(SetModel(
      exercise: selectedExercise.value,
      weight: weight,
      reps: reps,
      title: title,
    ));
    weightController.clear();
    repsController.clear();
  }

  void removeSet(int index) {
    sets.removeAt(index);
  }

  void addWorkout(Workout workout) {
    workouts.insert(0, workout);
    _storageService.saveWorkouts(workouts);
  }

  void updateWorkout(int index, Workout updatedWorkout) {
    workouts[index] = updatedWorkout;
    _storageService.saveWorkouts(workouts);
  }

  void deleteWorkout(int index) {
    workouts.removeAt(index);
    _storageService.saveWorkouts(workouts);
  }

  void reset() {
    sets.clear();
    selectedExercise.value = 'Barbell row';
    weightController.clear();
    repsController.clear();
    titleController.clear();
  }
}
