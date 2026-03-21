import 'package:dartz/dartz.dart';
import 'package:to_do_task/core/constant/app_urls.dart';
import 'package:to_do_task/core/error/failures.dart';
import 'package:to_do_task/core/error/server_exception.dart';
import 'package:to_do_task/core/network/network_caller.dart';
import 'package:to_do_task/feature/get_product/data/model/product_model.dart';

class ProductService {
  Future<Either<Failure, List<ProductModel>>> getProduct() async {
    final result = await NetworkCaller.get(url: AppUrls.getProductUrl);
    try {
      // if(result.isSuccess){
      //   return Right(productModelFromJson(jsonEncode(result)));
      // }
      if (result.isSuccess) {
        final data = result.data?['data']; // 👈 main fix

        return Right(
          List<ProductModel>.from(data.map((x) => ProductModel.fromJson(x))),
        );
      } else {
        return Left(
          ServerFailure(result.errorMessage ?? 'Something error happened!'),
        );
      }
    } catch (e) {
      return Left(handleException(e, StackTrace.current));
    }
  }
}
