import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/Presentation_layer/Home/widgets/product_widget.dart';

import '../View_model/home_viewModel.dart';

class productListWidget extends StatefulWidget {
  const productListWidget({super.key});

  @override
  State<productListWidget> createState() => _productListWidgetState();
}

class _productListWidgetState extends State<productListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductViewModel>()..GetProduct();
  }
  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<ProductViewModel,ProductStates>(
      buildWhen: (previous, current) {
        if(current is ProductSuccessStates || current is ProductErrorStates || current is ProductLoadingStates){
          return true ;
        }
        return false;
      },
      builder:   (context, state) {
        if(state is ProductErrorStates){
          return Center(child: Text("${state.Error}"),);
        }
        if(state is ProductSuccessStates){
          return    SizedBox(
            height: 800.h,
            child: Padding(
              padding:  REdgeInsets.all(16.0),
              child: GridView.builder(
                  scrollDirection: Axis.vertical,

                  itemBuilder: (context, index) => ProductWidget(state.products[index] ),
                  itemCount: state.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.h,
                      childAspectRatio: 3 / 4,
                      mainAxisSpacing: 16.h

                  ),
              ),
            ),
          );
        }
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }
}
