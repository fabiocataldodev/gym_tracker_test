import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_tracker_test/app_config/app_colors.dart';
import 'package:gym_tracker_test/app_config/utils/get_image_path.dart';
import 'package:gym_tracker_test/controller/work_out_controller.dart';

class DropdownItens extends GetView<WorkoutController> {
  DropdownItens({super.key});

  final GetImagePath imagePathProvider = GetImagePath();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: DropdownButton<String>(
          isExpanded: true,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.primaryColor,
          ),
          underline: Container(
            height: 1,
            color: AppColors.primaryColor,
          ),
          dropdownColor: Colors.white,
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
                    child: Row(
                      children: [
                        Image.asset(
                          imagePathProvider.getImagePath(exercise),
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 8),
                        Text(exercise),
                      ],
                    ),
                  ))
              .toList(),
          onChanged: (value) => controller.selectedExercise.value = value!,
        ),
      );
    });
  }
}
