import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:gym_tracker_test/controller/work_out_controller.dart';
import 'package:gym_tracker_test/models/workout_model.dart';
import 'package:gym_tracker_test/screens/work_out_list_screen.dart';
import 'package:mockito/mockito.dart';

class MockWorkoutController extends Mock implements WorkoutController {}

void main() {
  late MockWorkoutController mockWorkoutController;

  setUp(() {
    mockWorkoutController = MockWorkoutController();
    Get.put<WorkoutController>(mockWorkoutController);
  });

  testWidgets('WorkoutListScreen displays no list set when workouts are empty',
      (WidgetTester tester) async {
    when(mockWorkoutController.workouts).thenReturn(<Workout>[].obs);

    await tester.pumpWidget(MaterialApp(
      home: WorkoutListScreen(),
    ));

    expect(find.text('No workouts available'), findsOneWidget);
  });

  testWidgets('WorkoutListScreen displays workout list',
      (WidgetTester tester) async {
    final workout = Workout(
      sets: [],
      date: DateTime.now(),
      title: 'Test Workout',
    );

    when(mockWorkoutController.workouts).thenReturn(<Workout>[workout].obs);

    await tester.pumpWidget(MaterialApp(
      home: WorkoutListScreen(),
    ));

    expect(find.text('Test Workout'), findsOneWidget);
  });
}
