# agri_app

A new Flutter project.

## Getting Started

- Create flavor environment

  - Install `flutter pub add flutter_flavorizr`
  - https://pierre-dev.hashnode.dev/get-the-best-out-of-flutter-flavors-with-flutterflavorizr

- Create app icon
  - File name: flutter_launcher_icons.yaml, fluter_launcher_icon-dev.yaml, ...
  ```sh
  flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons*
  ```

## 1. Tools

- Generating Models, Routers

  ```sh
  # Watch mode
  flutter pub run build_runner watch --delete-conflicting-outputs

  # Build mode
  flutter pub run build_runner build --delete-conflicting-outputs
  ```

- Generating I18n
  ```sh
  flutter pub run i18n_json
  ```

## 2. Build app

### Android

- DEV

  ```sh
  # Build apk
  flutter build apk --flavor dev -t lib/main_dev.dart

  # Build appBundle
  flutter build appbundle  --flavor dev -t lib/main_dev.dart
  ```

- PROD

  ```sh
  # apk
  flutter build apk --flavor prod -t lib/main_prod.dart

  # appBundle
  flutter build appbundle --flavor prod -t lib/main_prod.dart
  ```

### Web

- DEV

  ```sh
  # with auto renderer
  flutter build web  --flavor dev -t lib/main_dev.dart

  # with canvaskit renderer
  flutter build web --web-renderer canvaskit  --flavor dev -t lib/main_dev.dart

  # with html renderer
  flutter build web --web-renderer html  --flavor dev -t lib/main_dev.dart
  ```

- PROD

  ```sh
  # with auto renderer
  flutter build web  --flavor prod -t lib/main_prod.dart

  # with canvaskit renderer
  flutter build web --web-renderer canvaskit  --flavor prod -t lib/main_prod.dart

  # with html renderer
  flutter build web --web-renderer html  --flavor prod -t lib/main_prod.dart
  ```

## 3. Run app

- Before run you must generating Models, Routers by command

```sh
flutter pub run build_runner watch --delete-conflicting-outputs
```

- Enter this command

```sh
# Dev
flutter run --flavor dev -t lib/main_dev.dart
# Prod
flutter run --flavor prod -t lib/main_prod.dart
```

- Choose adevice to run
- Flutter run key commands
  - r Hot reload. 🔥🔥🔥
  - R Hot restart.
  - h List all available interactive commands.
  - d Detach (terminate "flutter run" but leave application running).
  - c Clear the screen
  - q Quit (terminate the application on the device).

## 4. Cloud Function

Navigate to the firebase/functions folder to run the command

### Serve

```sh
  npm run serve
```

### Deploy

```sh
  # Dev
  npm run deploy-dev
  # Prod
  npm run deploy-prod
```
