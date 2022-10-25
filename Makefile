.PHONY: setup
setup:
	npm install

.PHONY: dependencies
dependencies:
	flutter pub get

.PHONY: build-runner
build-runner:
	flutter packages pub run build_runner build --delete-conflicting-outputs

.PHONY: build-android-dev
build-android-dev:
	flutter build apk --flavor dev -t lib/environment/main_dev.dart

.PHONY: build-android-prd
build-android-prd: 
	flutter build apk --release --flavor prod -t lib/environment/main_prod.dart

.PHONY: build-android-mock
build-android-mock: 
	flutter build apk --flavor mock -t lib/environment/main_mock.dart

.PHONY: build-ios-dev
build-ios-dev:
	flutter build ios --no-codesign --flavor dev -t lib/environment/main_dev.dart

.PHONY: build-ios-prd
build-ios-prd: 
	flutter build ios --release --no-codesign --flavor prod -t lib/environment/main_prod.dart

.PHONY: build-ios-mock
build-ios-mock: 
	flutter build ios --no-codesign --flavor mock -t lib/environment/main_mock.dart

.PHONY: run-dev
run-dev:
	flutter run --flavor dev -t lib/environment/main_dev.dart

.PHONY: run-prd
run-prd: 
	flutter run --release --flavor prod -t lib/environment/main_prod.dart

.PHONY: run-mock
run-mock: 
	flutter run --flavor mock -t lib/environment/main_mock.dart
