import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_task/feature/get_product/data/model/product_model.dart';
import 'package:to_do_task/feature/get_product/data/service/product_service.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  ProductService service=ProductService();
  ProductBloc() : super(ProductInitial()) {
    on<FetchProduct>(_handleFetchProduct);
  }
  Future<void>_handleFetchProduct(FetchProduct event,Emitter<ProductState>emit)async{
   try{
     emit(ProductLoading());
     final result=await service.getProduct();
     result.fold((fail){
       emit(ProductFailed(message: fail.message));
     }, (success){
       emit(ProductSuccess(modelResponse: success));
       print("''''''''''''''''''''$success''''''''''''''''''''");
     });
   }
   catch(e){
     emit(ProductFailed(message: e.toString()));
   }
  }
}
