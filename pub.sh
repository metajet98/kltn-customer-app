flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run easy_localization:generate -S lang -f keys -o locale_keys.g.dart
