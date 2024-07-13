import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_task/Presentation_layer/Home/widgets/Custom_filed.dart';
import '../core/DI/di.dart';
import '../core/Utils/assets_manager.dart';
import 'Home/View_model/home_viewModel.dart';
import 'Home/widgets/Product_list_widget.dart';
import 'Home/widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<ProductViewModel>(),
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            AssetsManager.Route,
            height: 22.h,
            width: 66.w,
          ),
        ),
        body:  CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CustomFiled()),
            SliverToBoxAdapter(child: SizedBox(height: 20.h,)),
            SliverToBoxAdapter(child: productListWidget())

          ],
        ),
      ),
    );
  }
}