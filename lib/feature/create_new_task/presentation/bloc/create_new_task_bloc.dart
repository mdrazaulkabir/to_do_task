import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_task/feature/create_new_task/data/service/create_task_service.dart';

part 'create_new_task_event.dart';
part 'create_new_task_state.dart';

class CreateNewTaskBloc extends Bloc<CreateNewTaskEvent, CreateNewTaskState> {
  CreateTaskService apiCallService=CreateTaskService();
  CreateNewTaskBloc() : super(CreateNewTaskInitial()) {
    on<CreateNewTaskEvent1>( _handleCreateNewTaskEvent);
  }

  Future<void>_handleCreateNewTaskEvent(CreateNewTaskEvent1 event, Emitter<CreateNewTaskState>emit)async{
    final payload = {
      "title": event.title,
      "description": event.description,
      "status": "New"
    };
    try{
      final result = await apiCallService.createTask(payload);
      result.fold((fail){
        emit(CreateNewTaskFailed(message: fail.message));
      }, (success){
        print("''''''''''''''''''''''''''''''''''''''$success''''''''''''''''''''''''''''''''''''''");
        emit(CreateNewTaskSuccess(message: success.toString()));
      });
    }
    catch(e){
      emit(CreateNewTaskFailed(message: e.toString()));
    }

  }
}
