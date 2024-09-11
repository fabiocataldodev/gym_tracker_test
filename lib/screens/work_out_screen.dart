import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_tracker_test/controller/work_out_controller.dart';
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
      appBar: AppBar(
        title: Text(workout == null ? 'New Workout' : 'Edit Workout'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller.titleController,
            decoration: const InputDecoration(labelText: 'Workout Title'),
          ),
          DropdownButton<String>(
            value: controller.selectedExercise.value,
            items: [
              'Barbell row',
              'Bench press',
              'Shoulder press',
              'Deadlift',
              'Squat'
            ]
                .map((exercise) => DropdownMenuItem(
                      value: exercise,
                      child: Text(exercise),
                    ))
                .toList(),
            onChanged: (value) => controller.selectedExercise.value = value!,
          ),
          TextField(
            controller: controller.weightController,
            decoration: const InputDecoration(labelText: 'Weight (kg)'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: controller.repsController,
            decoration: const InputDecoration(labelText: 'Reps'),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: controller.addSet,
            child: const Text('Add Set'),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.sets.length,
                  itemBuilder: (context, index) {
                    final set = controller.sets[index];
                    return Dismissible(
                      key: Key(set.hashCode.toString()),
                      onDismissed: (direction) {
                        controller.removeSet(index);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 1)
                            content: Text('${set.exercise} removed'),
                          ),
                        );
                      },
                      background: Container(
                        color: Colors.red,
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                            '${set.exercise}: ${set.weight}kg, ${set.reps} reps'),
                      ),
                    );
                  },
                )),
          ),
          ElevatedButton(
            onPressed: () {
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
            child: const Text('Save Workout'),
          ),
        ],
      ),
    );
  }
}
