import 'package:flutter/material.dart';
import 'package:to_do_task/app/routes/app_router.dart';
import 'package:to_do_task/app/routes/app_routes.dart';
import 'package:to_do_task/app/theme/app_theme.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkTheme,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}