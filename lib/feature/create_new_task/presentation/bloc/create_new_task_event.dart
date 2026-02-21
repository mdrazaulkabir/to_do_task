part of 'create_new_task_bloc.dart';

@immutable
sealed class CreateNewTaskEvent {}
class CreateNewTaskEvent1 extends CreateNewTaskEvent{
  final String title;
  final String description;
  CreateNewTaskEvent1({required this.title, required this.description});
}
