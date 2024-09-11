import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_tracker_test/app_config/app_colors.dart';
import 'package:gym_tracker_test/app_config/utils/get_image_path.dart';
import 'package:gym_tracker_test/controller/work_out_controller.dart';

class CustomCardList extends GetView<WorkoutController> {
  final GetImagePath imagePathProvider = GetImagePath();
  final int index;

  CustomCardList({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final workout = controller.workouts[index];

    return Padding(
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
                      color: AppColors.primaryColor),
                ),
                const Spacer(),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.primaryColor,
                )
              ],
            ).marginOnly(left: 8),
          ),
          Divider(
            endIndent: 16,
            indent: 16,
            color: Colors.grey[300],
            height: 1,
          ).marginOnly(top: 8),
          Column(
            children: List.generate(workout.sets.length * 2 - 1, (i) {
              if (i.isEven) {
                final setIndex = i ~/ 2;
                final set = workout.sets[setIndex];
                return ListTile(
                  leading: Image.asset(
                    imagePathProvider.getImagePath(set.exercise),
                    width: 80,
                  ),
                  title: Text(set.exercise),
                  subtitle: Text('${set.weight}kg, ${set.reps} reps'),
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
    );
  }
}
