import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_tracker_test/services/storage_service_impl.dart';
import 'package:integration_test/integration_test.dart';
import 'package:get/get.dart';
import 'package:gym_tracker_test/main.dart';
import 'package:gym_tracker_test/controller/work_out_controller.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
      'App navigates to workout screen, add a workout, set values and save',
      (WidgetTester tester) async {
    final storageService = StorageServiceImpl();
    Get.put(WorkoutController(storageService));

    await tester.pumpWidget(const MyApp());

    // Ensure initial widget is present
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('New Workout'), findsOneWidget);

    // Tap on the button to navigate to the workout screen
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Find and interact with the DropdownButton
    final dropdownFinder = find.byType(DropdownButton<String>);
    expect(dropdownFinder, findsOneWidget);
    await tester.tap(dropdownFinder);
    await tester.pumpAndSettle();

    // Verify the 'Enter your workout title' TextField is present and interact with it
    final titleTextFieldFinder = find.byKey(const Key('titleField'));
    expect(titleTextFieldFinder, findsOneWidget);
    await tester.enterText(titleTextFieldFinder, 'Set One');
    await tester.pump();

    // Select the 'Deadlift' item from the dropdown
    final itemFinder = find.text('Deadlift');
    expect(itemFinder, findsOneWidget);
    await tester.tap(itemFinder);
    await tester.pumpAndSettle();

    // Verify the 'Weight (kg)' TextField is present and interact with it
    final weightTextFieldFinder = find.byKey(const Key('weightField'));
    expect(weightTextFieldFinder, findsOneWidget);
    await tester.enterText(weightTextFieldFinder, '100');
    await tester.pumpAndSettle();

    // Verify the 'Repetitions' TextField is present and interact with it
    final repetitionsTextFieldFinder =
        find.byKey(const Key('repetitionsField'));
    expect(repetitionsTextFieldFinder, findsOneWidget);
    await tester.enterText(repetitionsTextFieldFinder, '10');
    await tester.pumpAndSettle();

    // Verify the entered text values
    expect(find.widgetWithText(TextField, '100'), findsOneWidget);
    expect(find.widgetWithText(TextField, '10'), findsOneWidget);

    // Verify the 'Add Set' button is present
    expect(find.text('Add Set'), findsOneWidget);

    // Tap on the 'Add Set' button do add the exercicse in a list
    await tester.tap(find.text('Add Set'));
    await tester.pumpAndSettle();

    // Verify the 'Save Workout' button is present
    expect(find.text('Save Workout'), findsOneWidget);

    // Tap on the 'Save Workout' button
    await tester.tap(find.text('Save Workout'));
    await tester.pumpAndSettle();
  });
}
