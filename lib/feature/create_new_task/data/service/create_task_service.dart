import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:to_do_task/core/constant/app_urls.dart';
import 'package:to_do_task/core/error/server_exception.dart';
import 'package:to_do_task/core/network/network_caller.dart';

import '../../../../core/error/failures.dart';

class CreateTaskService {

  Future<Either<Failure, Map<String,dynamic>>> createTask(dynamic payload) async {
   try{
     final result=await NetworkCaller.post(url: AppUrls.createNewTaskUrl,body: jsonEncode(payload) );

     if(result.isSuccess){
       return Right(result.data);
     }
     else{
       return Left(ServerFailure(result.errorMessage ?? "Something went wrong"));
     }
   }
   catch(e){
     return Left(handleException(e, StackTrace.current));
   }
  }

}