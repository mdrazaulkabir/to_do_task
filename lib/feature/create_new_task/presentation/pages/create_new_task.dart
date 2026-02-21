import 'package:flutter/material.dart';
import 'package:to_do_task/core/constant/app_colors.dart';
import 'package:to_do_task/feature/create_new_task/presentation/bloc/create_new_task_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CreateNewTask extends StatefulWidget {
  const CreateNewTask({super.key});

  @override
  State<CreateNewTask> createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CreateNewTaskBloc>().add(CreateNewTaskEvent1(title: "hello", description: "Now here i am calling in my laptop"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepRed,
    );
  }
}
