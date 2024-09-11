import 'package:get_storage/get_storage.dart';
import 'package:gym_tracker_test/models/workout_model.dart';
import './storage_service.dart';

class StorageServiceImpl implements StorageService {
  final GetStorage box = GetStorage();

  @override
  void saveWorkouts(List<Workout> workouts) {
    box.write('workouts', workouts.map((w) => w.toJson()).toList());
  }

  @override
  List<Workout> getWorkouts() {
    if (box.hasData('workouts')) {
      final data = box.read('workouts') as List<dynamic>;

      final workouts = data
          .map((json) => Workout.fromJson(json as Map<String, dynamic>))
          .toList();

      workouts.sort((a, b) => b.date.compareTo(a.date));

      return workouts;
    }
    return [];
  }
}
