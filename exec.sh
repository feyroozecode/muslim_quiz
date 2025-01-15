#!/bin/bash

# Project Name
PROJECT_NAME="islamic_quiz_app"


# Create Flutter Project

# Create lib Directory Structure
echo "Creating lib directory structure..."
mkdir -p lib/core/constants
mkdir -p lib/core/data/models
mkdir -p lib/core/data/data_sources
mkdir -p lib/core/data/network
mkdir -p lib/core/errors
mkdir -p lib/core/services
mkdir -p lib/core/theme
mkdir -p lib/core/utils
mkdir -p lib/core/widgets
mkdir -p lib/core/providers
mkdir -p lib/features/quiz/data/models
mkdir -p lib/features/quiz/data/repositories
mkdir -p lib/features/quiz/domain/entities
mkdir -p lib/features/quiz/domain/repositories
mkdir -p lib/features/quiz/presentation/controllers
mkdir -p lib/features/quiz/presentation/pages
mkdir -p lib/features/quiz/presentation/widgets

# Create Initial Files in Core Layer
echo "Creating initial files in core layer..."
touch lib/core/constants/app_constants.dart
touch lib/core/data/models/base_model.dart
touch lib/core/data/data_sources/mock_data_source.dart
touch lib/core/data/network/api_client.dart
touch lib/core/errors/app_exceptions.dart
touch lib/core/services/common_service.dart
touch lib/core/theme/app_color.dart
touch lib/core/theme/app_theme.dart
touch lib/core/utils/app_utils.dart
touch lib/core/widgets/custom_widgets.dart
touch lib/core/providers/app_providers.dart


#Create Initial Files in Quiz Feature Layer
echo "Creating initial files in quiz feature layer..."
touch lib/features/quiz/data/models/quiz_model.dart
touch lib/features/quiz/data/repositories/quiz_repository_impl.dart
touch lib/features/quiz/domain/entities/quiz_entity.dart
touch lib/features/quiz/domain/repositories/quiz_repository.dart
touch lib/features/quiz/presentation/controllers/quiz_controller.dart
touch lib/features/quiz/presentation/pages/quiz_page.dart
touch lib/features/quiz/presentation/pages/quiz_result_page.dart
touch lib/features/quiz/presentation/widgets/quiz_widgets.dart

#Modify Main Entry Point
echo "Modifying Main Entry Point"
cat << EOF > lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/quiz/presentation/pages/quiz_page.dart';
import 'core/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
      builder: (context,_) {
        return MaterialApp(
          title: 'Islamic Quiz App',
          theme: AppTheme.lightTheme,
          home: const QuizPage(),
        );
      },
    );
  }
}

EOF

# Add Dependencies to pubspec.yaml
echo "Adding dependencies to pubspec.yaml..."
sed -i '' '/dependencies:/a \
      flutter_riverpod: ^2.4.1\
      freezed_annotation: ^2.4.1\
      json_annotation: ^4.8.1\
      equatable: ^2.0.5\
      cached_network_image: ^3.2.0\
      flutter_animate: ^4.2.0\
      lottie: ^2.7.0\
      cupertino_icons: ^1.0.2\
      flutter_screenutil: ^5.9.0' pubspec.yaml

sed -i '' '/dev_dependencies:/a \
      build_runner: ^2.4.6\
      freezed: ^2.4.1\
      json_serializable: ^6.7.1' pubspec.yaml


# Run Flutter Pub Get
echo "Running flutter pub get..."
flutter pub get

echo "Project setup complete!"
echo "cd into '$PROJECT_NAME' to start development."
