import '../models/workout_model.dart';

abstract interface class StorageService {
  void saveWorkouts(List<Workout> workouts);
  List<Workout> getWorkouts();
}
