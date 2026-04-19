import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_task/app/routes/app_routes.dart';
import 'package:to_do_task/feature/create_new_task/presentation/pages/create_new_task.dart';
import 'package:to_do_task/feature/get_product/presentation/pages/get_product.dart';
import 'package:to_do_task/feature/all_task_screen.dart';
import 'package:to_do_task/feature/splash_screen/splash_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings){
    switch(settings.name){
      case AppRoutes.splash:
        return CupertinoPageRoute(builder: (_)=>SplashScreen());
      case AppRoutes.newTaskScreen:
        return CupertinoPageRoute(builder: (_)=>NewTaskScreen());
      case AppRoutes.createNewTask:
        return CupertinoPageRoute(builder: (_)=>CreateNewTask());
      case AppRoutes.getProductUrl:
        return CupertinoPageRoute(builder: (_)=>GetProduct());
      default:
        return CupertinoPageRoute(builder: (_)=>Scaffold(body: Center(child: Text('Route note found!'),),));
    }
  }
}