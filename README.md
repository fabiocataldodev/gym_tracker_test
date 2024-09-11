Gym Tracker Test

Description: A TestApp for tracking workouts for MagicAI hiring process.

Features

    •	Record workouts with details such as title, weight, and repetitions.
    •	View a list of all recorded workouts.
    •	Edit and delete existing workouts using dismissable widgets.
    •	Edit and delete individual exercises using dismissable widgets.
    •	Persistent storage using GetStorage.
    •	State management with GetX.

Technologies Used

    •	Flutter: A framework for building natively compiled applications for mobile, web, and desktop from a single codebase.
    •	GetX: A powerful and lightweight solution for state management, route management, and dependency injection. Chosen for its simplicity and efficiency in managing state and routes without boilerplate code.
    •	GetStorage: A simple and efficient key-value storage system. Selected for its ease of use and minimal setup compared to alternatives like SharedPreferences or Hive.
    •	Mockito: A library for creating mocks and stubs. Used in unit testing to simulate dependencies and verify that functions and interactions behave as expected.

Installation

To set up the project locally, follow these steps:

    1.	Clone the repository:

    git clone https://github.com/fabiocataldodev/gym_tracker_test.git
    cd gym_tracker_test

    2.	Install dependencies:
    flutter pub get

    3.	Run the application:
    flutter run

Project Structure

The project follows the MVC (Model-View-Controller) pattern:

    •	lib/
    •	app_config/: Contains theme data and other configuration settings.
    •	controllers/: Contains the WorkoutController for managing workout data and state.
    •	models/: Defines data models used in the application.
    •	screens/: Contains all the screens of the application.
    •	widgets/: Reusable widgets used across different screens.
    •	services/: Contains the implementation of StorageService for persistent storage.

Design Principles

The project adheres to the following design principles:

    •	Clean Code: The code is written with readability and maintainability in mind. Functions and classes are small, well-named, and follow a consistent style.
    •	SOLID Principles: The project follows SOLID principles to ensure a scalable and flexible codebase:

Testing

To run unit tests, widget tests, and integration tests, use the following command:
flutter test

Integration Tests

To run integration tests, which test the interaction between different parts of the application and its overall behaviour, use the following command:
flutter test integration_test/app_test.dart

Ensure that you have the testing environment properly set up and that all prerequisites are installed.

<video controls src="Simulator Screen Recording - iPhone 15 Pro Max - 2024-09-11 at 20.mp4" title="Title"></video>
