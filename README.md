# AppFlix

An app that lists popular or trending movies and allows searching by terms.

## Technologies Used

This project uses the following technologies and packages:

- Flutter SDK: The framework used to build the app.
- [auto_route](https://pub.dev/packages/auto_route) (^8.2.0): For declarative routing and navigation management.
- [bloc](https://pub.dev/packages/bloc) (^8.1.4): A predictable state management library.
- [bloc_concurrency](https://pub.dev/packages/bloc_concurrency) (^0.2.5): For managing concurrent events in BLoC.
- [bloc_test](https://pub.dev/packages/bloc_test) (^9.1.7): Utilities to help test BLoC.
- [cached_network_image](https://pub.dev/packages/cached_network_image) (^3.3.1): For displaying images from the network with caching functionality.
- [cupertino_icons](https://pub.dev/packages/cupertino_icons) (^1.0.6): Icons matching Apple's design language.
- [dartz](https://pub.dev/packages/dartz) (^0.10.1): Functional programming library for Dart.
- [equatable](https://pub.dev/packages/equatable) (^2.0.5): Simplifies equality comparisons in Dart.
- [freezed_annotation](https://pub.dev/packages/freezed_annotation) (^2.4.0): Code generation for unions/pattern-matching/copy.
- [freezed](https://pub.dev/packages/freezed) (^2.5.2): Simplifies data classes in Dart.
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) (^8.1.6): Widgets that integrate with BLoC for state management.
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) (^5.1.0): For loading environment variables from a .env file.
- [flutter_svg](https://pub.dev/packages/flutter_svg) (^2.0.10+1): For rendering SVG files.
- [get_it](https://pub.dev/packages/get_it) (^7.7.0): A simple service locator for dependency injection.
- [hero_animation](https://pub.dev/packages/hero_animation) (^1.1.4): For implementing hero animations.
- [http](https://pub.dev/packages/http) (^1.2.1): A composable API for making HTTP requests.
- [intl](https://pub.dev/packages/intl) (^0.19.0): For internationalization and localization.
- [mocktail](https://pub.dev/packages/mocktail) (^1.0.4): A Dart mocking library for testing.

### Dev Dependencies

- [auto_route_generator](https://pub.dev/packages/auto_route_generator) (^8.0.0): Code generation for `auto_route`.
- [build_runner](https://pub.dev/packages/build_runner) (^2.4.11): Runs code generators.
- [flutter_test](https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html) (SDK: flutter): Provides testing utilities for Flutter apps.
- [flutter_lints](https://pub.dev/packages/flutter_lints) (^4.0.0): Lint rules for Dart and Flutter.
- [json_serializable](https://pub.dev/packages/json_serializable) (^6.8.0): Generates JSON serialization code.


## Implemented Routes

- Listing of popular or trending movies
- Movie details page

## How to Initialize the Project

Follow the steps below to set up and run the project locally.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) installed on your machine.
- [Dart SDK](https://dart.dev/get-dart) installed.
- Recommended code editor: [Visual Studio Code](https://code.visualstudio.com/) with Flutter and Dart extensions.

### Steps

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/your-project-name.git
   cd your-project-name

2. **Install dependencies:**

   ```bash
   flutter pub get

3. **Generate necessary code (if applicable)**

   ```bash
   make build_runner

4. **Configure environment variables**

   - Copy the .env.example file to a new .env file

5. **App Test Coverage**

   ```bash
   make app_coverage


