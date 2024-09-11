import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_tracker_test/app_config/app_colors.dart';
import 'package:gym_tracker_test/app_config/utils/get_image_path.dart';
import 'package:gym_tracker_test/controller/work_out_controller.dart';
import 'package:gym_tracker_test/screens/widgets/custom_card_list.dart';
import 'package:gym_tracker_test/screens/widgets/custom_floating_button.dart';
import 'package:gym_tracker_test/screens/widgets/no_list_set.dart';
import 'package:gym_tracker_test/screens/work_out_screen.dart';

class WorkoutListScreen extends GetView<WorkoutController> {
  WorkoutListScreen({super.key});

  final GetImagePath imagePathProvider = GetImagePath();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout List'),
      ),
      body: Obx(() {
        if (controller.workouts.isEmpty) {
          return const NoListSet();
        }
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
                  child: CustomCardList(index: index),
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
