import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_task/app/routes/app_router.dart';
import 'package:to_do_task/app/routes/app_routes.dart';
import 'package:to_do_task/app/theme/app_theme.dart';
import 'package:to_do_task/feature/get_product/presentation/bloc/product_bloc.dart';

import '../feature/create_new_task/presentation/bloc/create_new_task_bloc.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//
//       theme: AppTheme.lightTheme,
//       themeMode: ThemeMode.system,
//       darkTheme: AppTheme.darkTheme,
//
//       initialRoute: AppRoutes.splash,
//       onGenerateRoute: AppRouter.generateRoutes,
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        /// CreateNewTask Bloc
        BlocProvider(
          create: (_) => CreateNewTaskBloc(),
        ),

        /// future e aro bloc add korte parba
        BlocProvider( create:(_)=>ProductBloc(),),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,

        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.system,
        darkTheme: AppTheme.darkTheme,

        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRouter.generateRoutes,
      ),
    );
  }
}