# Your App

A Flutter application using clean architecture with GetX state management.

## Features

- Clean Architecture with separation of concerns
- GetX for state management and dependency injection
- Hive for local database
- Firebase integration (Analytics, Messaging, Crashlytics)
- Multi-language support
- Theme management (Light/Dark mode)
- Comprehensive error handling
- Unit, Widget, and Integration tests

## Project Structure

```
lib/
├── common_widgets/      # Reusable UI components
├── controllers/         # GetX controllers for state management
├── core/               # Core utilities, constants, and services
│   ├── constants/      # App-wide constants
│   ├── extensions/     # Dart extensions
│   ├── helpers/        # Helper classes
│   ├── routes/         # Navigation routes
│   ├── services/       # Core services
│   └── theme/          # Theme configuration
├── data/               # Data layer
│   ├── models/         # Data models
│   └── dto/            # Data transfer objects
├── l10n/               # Localization files
├── repository/         # Repository pattern implementation
├── views/              # UI screens and widgets
├── get_it.dart         # Dependency injection setup
└── main.dart           # App entry point
```

## Getting Started

### Prerequisites

- Flutter SDK (>=3.10.0)
- Dart SDK (>=3.0.0)
- Firebase account (for Firebase features)

### Installation

1. Clone the repository
```bash
git clone <repository-url>
cd your_app
```

2. Install dependencies
```bash
flutter pub get
```

3. Configure environment variables
```bash
cp .env.example .env
# Edit .env with your configuration
```

4. Run code generation
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

5. Run the app
```bash
flutter run
```

## Running Tests

```bash
# Run all tests
flutter test

# Run specific test
flutter test test/unit/controllers/home_controller_test.dart

# Run with coverage
flutter test --coverage
```

## Building for Production

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## Architecture Overview

This project follows Clean Architecture principles:

- **Views**: UI layer, handles user interactions
- **Controllers**: Business logic and state management
- **Repositories**: Data access abstraction
- **Services**: Core functionality (DB, Network, Auth, etc.)
- **Models**: Data structures

## Code Generation

This project uses code generation for:
- Hive type adapters
- JSON serialization

Run the following command after making changes to models:
```bash
flutter packages pub run build_runner watch --delete-conflicting-outputs
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
