import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_tracker_test/app_config/app_colors.dart';
import 'package:gym_tracker_test/app_config/utils/get_image_path.dart';
import 'package:gym_tracker_test/controller/work_out_controller.dart';
import 'package:gym_tracker_test/screens/widgets/custom_floating_button.dart';
import 'package:gym_tracker_test/screens/work_out_screen.dart';

class WorkoutListScreen extends GetView<WorkoutController> {
  WorkoutListScreen({super.key});

  final GetImagePath imagePathProvider = GetImagePath();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        title: const Text('Workout List'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.workouts.length,
          itemBuilder: (context, index) {
            final workout = controller.workouts[index];
            return Dismissible(
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
              key: Key(workout.date.toIso8601String()),
              onDismissed: (direction) => controller.deleteWorkout(index),
              child: Card(
                color: AppColors.secondaryColor,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => WorkoutScreen(
                          workout: workout,
                          index: index,
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                workout.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.chevron_right,
                                color: AppColors.primaryColor,
                              )
                            ],
                          ),
                        ),
                        Column(
                          children:
                              List.generate(workout.sets.length * 2 - 1, (i) {
                            if (i.isEven) {
                              final setIndex = i ~/ 2;
                              final set = workout.sets[setIndex];
                              return ListTile(
                                leading: Image.asset(
                                  imagePathProvider.getImagePath(set.exercise),
                                  width: 80,
                                ),
                                title: Text(set.exercise),
                                subtitle:
                                    Text('${set.weight}kg, ${set.reps} reps'),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Divider(
                                  endIndent: 16,
                                  indent: 16,
                                  color: Colors.grey[300],
                                  height: 1,
                                ),
                              );
                            }
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: const CustomFloatingButton(),
    );
  }
}
