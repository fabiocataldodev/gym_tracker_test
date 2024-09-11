import 'package:get_storage/get_storage.dart';
import 'package:gym_tracker_test/models/workout_model.dart';

class StorageService {
  final box = GetStorage();

  void saveWorkouts(List<Workout> workouts) {
    box.write('workouts', workouts.map((w) => w.toJson()).toList());
  }

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
