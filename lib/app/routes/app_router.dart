import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_task/app/routes/app_routes.dart';
import 'package:to_do_task/feature/new_task_screen.dart';
import 'package:to_do_task/feature/splash_screen/splash_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case AppRoutes.splash:
        return CupertinoPageRoute(builder: (_)=>SplashScreen());
      case AppRoutes.newTaskScreen:
        return CupertinoPageRoute(builder: (_)=>NewTaskScreen());
      default:
        return CupertinoPageRoute(builder: (_)=>Scaffold(body: Center(child: Text('Route note found!'),),));
    }
  }
}