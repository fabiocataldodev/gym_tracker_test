import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gym_tracker_test/app_config/theme_data.dart';
import 'package:gym_tracker_test/controller/work_out_controller.dart';
import 'package:gym_tracker_test/screens/work_out_list_screen.dart';
import 'package:gym_tracker_test/services/storage_service.dart';
import 'package:gym_tracker_test/services/storage_service_impl.dart';

void main() async {
  await GetStorage.init();

  //ERASE ALL STORAGE CONTENT

  // final storage = GetStorage();
  // storage.erase();

  final StorageService storageService = StorageServiceImpl();

  final WorkoutController workoutController = WorkoutController(storageService);

  Get.put<StorageService>(storageService);
  Get.put<WorkoutController>(workoutController);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workout Tracker',
      theme: buildThemeData(),
      home: WorkoutListScreen(),
    );
  }
}
