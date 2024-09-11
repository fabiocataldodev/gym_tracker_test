import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_tracker_test/app_config/app_colors.dart';
import 'package:gym_tracker_test/app_config/utils/get_image_path.dart';
import 'package:gym_tracker_test/controller/work_out_controller.dart';

class SetList extends GetView<WorkoutController> {
  SetList({super.key});

  final GetImagePath imagePathProvider = GetImagePath();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ReorderableListView.builder(
          onReorder: (int oldIndex, int newIndex) {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            controller.reorderSet(oldIndex, newIndex);
          },
          itemCount: controller.sets.length,
          itemBuilder: (context, index) {
            final set = controller.sets[index];
            return Dismissible(
              key: Key(set.hashCode.toString()),
              onDismissed: (direction) {
                controller.removeSet(index);
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
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      imagePathProvider.getImagePath(set.exercise),
                      width: 80,
                      height: 80,
                    ),
                    title: Text(
                      set.exercise,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${set.weight}kg, ${set.reps}x repetitions'),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
