import 'package:flutter/material.dart';
import 'package:to_do_task/app/routes/app_routes.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4),(){
      Navigator.pushNamed(context, AppRoutes.newTaskScreen);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(Icons.person,size: 250,),
      ),
    );
  }
}
