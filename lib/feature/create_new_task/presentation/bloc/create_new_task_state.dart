part of 'create_new_task_bloc.dart';

@immutable
sealed class CreateNewTaskState {}

final class CreateNewTaskInitial extends CreateNewTaskState {}
final class CreateNewTaskLoading extends CreateNewTaskState{}
final class CreateNewTaskSuccess extends CreateNewTaskState{
  final String message;
  CreateNewTaskSuccess({required this.message});
}
final class CreateNewTaskFailed extends CreateNewTaskState{
  final String? message;
  CreateNewTaskFailed({required this.message});
}
