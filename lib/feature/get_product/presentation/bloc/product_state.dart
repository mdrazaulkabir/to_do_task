part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductLoading extends ProductState{}
final class ProductSuccess extends ProductState{
  final List<ProductModel> modelResponse;
  ProductSuccess({required this.modelResponse});
}
final class ProductFailed extends ProductState{
  final String message;
  ProductFailed({required this.message});
}