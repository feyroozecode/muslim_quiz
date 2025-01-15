import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

