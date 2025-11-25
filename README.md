# Rick and Morty Flutter App

A Flutter application that displays characters from the Rick and Morty TV series using the [Rick and Morty API](https://rickandmortyapi.com/).

## Features

- Browse all Rick and Morty characters
- Search for specific characters
- View detailed character information
- Offline caching support
- Clean Architecture implementation
- State management with BLoC pattern

## Architecture

This project follows **Clean Architecture** principles with three main layers:

### Domain Layer
- **Entities**: Core business models (`PersonEntity`)
- **Repositories**: Abstract repository interfaces
- **Use Cases**: Business logic (`GetAllPersons`, `SearchPerson`)

### Data Layer
- **Models**: Data transfer objects with JSON serialization
- **Data Sources**: Remote (API) and Local (SharedPreferences) data sources
- **Repository Implementation**: Concrete implementation with offline-first approach

### Presentation Layer
- **Pages**: UI screens (`PersonScreen`, `PersonDetailScreen`)
- **Widgets**: Reusable UI components
- **BLoC/Cubit**: State management (`PersonListCubit`, `PersonSearchBloc`)

## Tech Stack

- **Flutter SDK**: >=3.3.0 <4.0.0
- **State Management**: flutter_bloc ^8.1.4
- **Dependency Injection**: get_it ^7.6.7
- **HTTP Client**: dio ^5.4.1
- **Local Storage**: shared_preferences ^2.2.2
- **Network Checking**: internet_connection_checker ^1.0.0+1
- **Image Caching**: cached_network_image ^3.3.1
- **Functional Programming**: dartz ^0.10.1
- **Value Equality**: equatable ^2.0.5
- **Code Generation**: freezed ^2.4.7, json_serializable ^6.7.1

## Project Structure

```
lib/
├── core/
│   ├── error/          # Exception and failure handling
│   ├── platform/       # Network connectivity checking
│   └── usecases/       # Base use case interface
├── feature/
│   ├── data/
│   │   ├── datasources/    # Remote and local data sources
│   │   ├── models/         # Data models
│   │   └── repositories/   # Repository implementations
│   ├── domain/
│   │   ├── entities/       # Business entities
│   │   ├── repositories/   # Repository interfaces
│   │   └── usecases/       # Business logic
│   └── presentories/
│       ├── bloc/           # BLoC and Cubit state management
│       ├── pages/          # Screen widgets
│       └── widgets/        # Reusable UI components
├── common/             # Shared resources (colors, constants)
├── locator_service.dart    # Dependency injection setup
└── main.dart          # App entry point
```

## Getting Started

### Prerequisites

- Flutter SDK (>=3.3.0)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- iOS development tools (for macOS users)

### Installation

1. Clone the repository:
```bash
git clone git@github.com:gvpaleev/RickAndMorty.git
cd RickAndMorty
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run code generation:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Run the app:
```bash
flutter run
```

## Platform Support

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## Key Features Implementation

### Offline-First Architecture
The app checks network connectivity and falls back to cached data when offline, ensuring a seamless user experience.

### Search Functionality
Real-time character search with debouncing to optimize API calls.

### Image Caching
Character images are cached locally for faster loading and offline access.

## Development

### Running Tests
```bash
flutter test
```

### Building for Production

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

**Web:**
```bash
flutter build web --release
```

## API Reference

This app uses the [Rick and Morty API](https://rickandmortyapi.com/documentation) to fetch character data.

## License

This project is for educational purposes.

## Acknowledgments

- [Rick and Morty API](https://rickandmortyapi.com/) for providing the data
- The Flutter community for excellent packages and resources
