Certainly! Here’s the updated `README.md` with a **Clean Architecture Folder Structure** section, which shows how the app is organized according to Clean Architecture principles. The folder structure you described includes models, services, stores, presentations, utilities, and routers, with modular organization under the presentation layer.

### Full `README.md` with Clean Architecture Folder Structure:

```markdown
# Flutter Project



![App Light modeDemo](https://drive.google.com/uc?export=view&id=1z8D4kLss1uHg-27s8bW8H5ErJb_z2hxu)
![App Dark mode Demo](https://drive.google.com/uc?export=view&id=1z8D4kLss1uHg-27s8bW8H5ErJb_z2hxu)

This project is built using Flutter and utilizes several packages for state management, networking, routing, local storage, and more. Below are the instructions to set up the project, explanations of the dependencies, assumptions made during development, and instructions on how to run unit tests.

## Table of Contents

- [Setup Instructions](#setup-instructions)
- [Dependencies](#dependencies)
- [Assumptions](#assumptions)
- [Clean Architecture Folder Structure](#clean-architecture-folder-structure)
- [Running Unit Tests](#running-unit-tests)

---

## Setup Instructions

### Prerequisites

Make sure you have the following installed:

- Flutter (preferably the latest stable version)
- Dart SDK (bundled with Flutter)
- Android Studio / Xcode / Visual Studio Code (for your preferred IDE)

### Steps to Setup the Project

1. **Clone the repository**

   Clone the repository to your local machine:

   ```bash
   git clone https://github.com/yourusername/your-flutter-project.git
   cd your-flutter-project
   ```

2. **Install Dependencies**

   Run the following command to fetch the project dependencies:

   ```bash
   flutter pub get
   ```

3. **Run the App**

   After setting up the dependencies, you can run the app on a connected device or emulator using:

   ```bash
   flutter run
   ```

---

## Dependencies

### Core Dependencies

- **`flutter`**: The Flutter SDK.
- **`flutter_mobx`**: State management using MobX for Flutter.
- **`http`**: To make HTTP requests.
- **`mobx`**: Core MobX package for reactive state management.
- **`provider`**: Another state management package, used alongside MobX.
- **`cupertino_icons`**: Cupertino-style icons for iOS-style applications.
- **`json_annotation`**: Used for JSON serialization in Flutter.
- **`path_provider`**: Helps with accessing the device file system.
- **`flutter_localizations`**: Provides support for localization in Flutter.
- **`intl`**: For internationalization and formatting.
- **`go_router`**: For declarative routing.
- **`auto_route`**: For routing and code generation.
- **`shared_preferences`**: A local storage plugin for saving simple data.
- **`font_awesome_flutter`**: Provides Font Awesome icons.
- **`flutter_svg`**: For displaying SVG images.
- **`carousel_slider`**: For displaying carousel sliders in your app.
- **`shimmer`**: Provides shimmer effect for loading screens.
- **`video_player`**: To play video content.
- **`youtube_player_flutter`**: Allows embedding YouTube videos.
- **`isar`**: A fast NoSQL database for Flutter.
- **`isar_flutter_libs`**: Required for working with Isar on Flutter.
- **`connectivity_plus`**: For checking internet connectivity.

### Development Dependencies

- **`flutter_test`**: The default test framework for Flutter.
- **`mobx_codegen`**: Code generation for MobX.
- **`build_runner`**: Code generation tool.
- **`auto_route_generator`**: Code generation for auto_route.
- **`isar_generator`**: Code generation for Isar database models.
- **`analyzer`**: Dart code analysis tool.
- **`mockito`**: A package for creating mock objects in tests.
- **`test`**: The test framework used for unit testing.
- **`flutter_lints`**: Provides recommended lint rules for Flutter projects.
- **`json_serializable`**: For JSON serialization code generation.

---

## Assumptions

The following assumptions were made while developing this project:

- The target platform for this project is both Android and iOS.
- The project makes use of local storage (`isar`) for storing persistent data and caching.
- Network connectivity is required for certain features (e.g., fetching data from an API).
- The app uses MobX for state management and relies on `flutter_mobx` and `mobx_codegen` for reactive state handling.
- The app requires localized content using `flutter_localizations` and `intl`.

- **TMDB API Integration:**
- All APIS are implemented
- 
- **Home Screen**
- Key Highlights=> Carousel;
- limited to 10 item in each sections
- pull-to-refresh functionality for reloading data.

- **Connectivity**
- Snackbar when internet gone.

- **"View All" sections**
- Caching, Pagination or Infinite Scroll Api based done,
- Key Highlights=> **Pagination or Infinite Scroll**: The app implements pagination or infinite scroll for the following sections:
   - **Search**
   - **Popular Movies**
   - **Now Playing**
   - **Top Rated Movies (in "View All" sections)**
  

- **Search Screen**
- search bar for users to search movies by title.
- Display search results in real-time as the user types.
  - Also pagination/ infinite scroll.
- Gridview for each result should show the movie poster, title, and rating.


- **Favorite Movie Screen**
- Isar handing the offline storage. 


- **Settings Screen**
- App theme inspired by Netflix. 
- 
- **Watch Trailers Screen**
- list of videos in bottom sheet and can be played title in player.
- flutter video player doesn't support youtube format so used `youtube flutter player`.
- **Performance Optimization**
- Infinite scroll is implementation to handle large data.


---

## Clean Architecture Folder Structure

The project follows the principles of **Clean Architecture** to separate concerns and ensure maintainability. Here's how the folder structure is organized:

```
lib/
├── src/
│   ├── models/                    # Contains data models and entities
│   ├── services/                  # Business logic and API services
│   ├── stores/                    # MobX state management stores
│   ├── presentation/              # UI-related code, split by features/modules
│   │   ├── custom/                # Custom components and widgets
│   │   ├── detail/                # Movie details feature
│   │   ├── movie_list/            # Movie list feature (Popular, Now Playing, etc.)
│   │   └── shared/                # Shared widgets across modules (e.g., loading spinners, error handling)
│   ├── utils/                     # Helper functions, enums, asset links, and constants
│   │   ├── helpers/               # Reusable utility functions
│   │   ├── strings.dart           # Text constants for the app
│   │   ├── asset_links.dart       # Asset paths (e.g., image URLs, icons)
│   │   └── enums.dart             # Enums used across the app (e.g., movie categories, sort types)
│   └── router/                    # Navigation and route management
```

### Folder Breakdown:

- **`models/`**: This folder contains all the data models and entities used throughout the app. Models represent the raw data structures that are used to interact with APIs or databases.

- **`services/`**: Contains business logic and services responsible for handling network requests, API communication, and managing data.
   - **`etc..`** 
- **`stores/`**: This folder houses all the **MobX** stores, which are used for reactive state management in the app.
   - **`etc..`** all store files in which whole app bussinus logic is written.
- **`presentation/`**: This is the UI layer, split by features/modules:
   - **`custom/`**: Custom UI components and widgets that can be reused across multiple parts of the app.
   - **`detail/`**: The **Movie Detail** screen, containing the UI for viewing a detailed movie page.
   - **`movie_list/`**: This folder holds the UI for displaying lists of movies (e.g., Popular, Now Playing, Search, Top Rated, etc.).
   - **`etc..`**
- **`utils/`**: Contains helper functions, constants, enums, and asset links.
   - **`helpers/`**: Helper methods like formatting functions, date utilities, etc.
   - **`strings.dart`**: A file where all the text constants (like button labels, screen titles) are defined.
   - **`asset_links.dart`**: Contains constants for URLs or paths to assets like images, videos, or icons.
   - **`enums.dart`**: Holds the enums used throughout the app (e.g., movie genres, movie sorting options).
   - **`etc..`**
- **`router/`**: Manages navigation across the app using either `go_router` or `auto_route`. This centralizes routing logic and ensures scalability.
 - At first though out it but didn't used.
---

## Running Unit Tests

To run unit tests for the project, you can use the following command:

```bash
flutter test test/movie_store_test.dart
```

This will run the tests in the specified file (`movie_store_test.dart`). If you'd like to run all the tests in the `test` directory, you can use:

```bash
flutter test
```

### Unit Test Libraries

The unit tests use the following libraries for mocking and testing:

- **`mockito`**: For creating mock objects and stubbing methods during testing.
- **`test`**: The default Dart testing framework.
- Unit test cases written for store actions which fetching the data. Basically on API service and core business logic. 

You can write unit tests by following this structure and mocking dependencies as needed using `mockito`.

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```

### Key Updates:
- Added a **Clean Architecture Folder Structure** section with a detailed breakdown of the folder structure.
- The app is organized into `models`, `services`, `stores`, `presentation`, `utils`, `router`, and `core` folders.
- Inside the **`presentation/`** folder, I included modular subfolders like `custom`, `detail`, and