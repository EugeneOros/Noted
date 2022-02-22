import 'package:flutter/material.dart';
import 'package:utopia_recruitment_task/routes/on_generate_route.dart';
import 'config/theme_data.dart';
import 'widgets/app_scroll_behavior.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noted',
      debugShowCheckedModeBanner: false,
      theme: getThemeData(),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: const AppScrollBehavior(),
          child: child!,
        );
      },
      initialRoute: '/',
      onGenerateRoute: (settings) => onGenerateRoute(settings),
    );
  }
}
