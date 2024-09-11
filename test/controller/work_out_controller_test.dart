import 'package:flutter_test/flutter_test.dart';
import 'package:gym_tracker_test/controller/work_out_controller.dart';
import 'package:gym_tracker_test/models/workout_model.dart';
import 'package:gym_tracker_test/services/storage_service.dart';
import 'package:mockito/mockito.dart';

class MockStorageService extends Mock implements StorageService {}

void main() {
  late WorkoutController controller;
  late MockStorageService mockStorageService;

  setUp(() {
    mockStorageService = MockStorageService();
    controller = WorkoutController(mockStorageService);
  });

  test('initial state', () {
    expect(controller.workouts, []);
    expect(controller.sets, []);
    expect(controller.selectedExercise.value, 'Barbell row');
  });

  test('addSet adds a new set', () {
    controller.weightController.text = '50';
    controller.repsController.text = '10';
    controller.titleController.text = 'Test Set';

    controller.addSet();

    expect(controller.sets.length, 1);
    expect(controller.sets.first.weight, 50);
    expect(controller.sets.first.reps, 10);
    expect(controller.sets.first.title, 'Test Set');
  });

  test('addWorkout updates storage', () {
    final workout = Workout(
      sets: [],
      date: DateTime.now(),
      title: 'Test Workout',
    );

    controller.addWorkout(workout);

    verify(mockStorageService.saveWorkouts([workout])).called(1);
  });
}
