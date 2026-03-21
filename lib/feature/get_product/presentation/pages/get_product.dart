import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:to_do_task/feature/get_product/data/model/product_model.dart';
import 'package:to_do_task/feature/get_product/presentation/bloc/product_bloc.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_images.dart';
import '../../../../core/constant/app_sizes.dart';

class GetProduct extends StatefulWidget {
  const GetProduct({super.key});

  @override
  State<GetProduct> createState() => _GetProductState();
}

class _GetProductState extends State<GetProduct> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(FetchProduct());
  }

  @override
  Widget build(BuildContext context) {
    final toolHeight = AppSizes.height(context, 200);
    // final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Container(
                height: toolHeight,
                width: double.infinity,
                color: AppColors.seed,
              ),
              Container(
                height: toolHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.map),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.white.withValues(alpha: .25),
                      BlendMode.modulate,
                    ),
                  ),
                ),
              ),
              // SafeArea(
              //   child: Container(
              //     child: Text('hello you name is :'),
              //   ),
              // )
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.width(context, 20),
                    vertical: AppSizes.height(context, 18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: const Text(
                          "Let's get your all product!!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              // final  List<ProductModel>data;
              if (state is ProductLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ProductFailed) {
                return Center(child: Text("can't fetch data"));
              } else if (state is ProductSuccess) {
                final product = state.modelResponse;
                return Expanded(
                  child: ListView.builder(
                    itemCount: product.length,
                    itemBuilder: (context, index) {
                      final data = product[index];
                      return Padding(
                        padding: const EdgeInsets.all(AppSizes.paddingBody),
                        child: ListTile(
                          // leading: SizedBox(
                          //   height: 40,
                          //   width: 40,
                          //   child: Image.network(
                          //     data.img != null ? '${data.img}' : '',
                          //   ),
                          // ),
                          leading: SizedBox(
                            height: 40,
                            width: 40,
                            child: (data.img != null && data.img!.isNotEmpty)
                                ? Image.network(
                                    data.img ?? '',
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Icon(Icons.broken_image),
                                  )
                                : Icon(Icons.image),
                          ),
                          title: Text('Name: ${data.productName}'),
                          subtitle: Text("Id is: ${data.productCode} "),
                        ),
                      );
                    },
                  ),
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
