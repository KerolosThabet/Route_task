import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/domain_layer/Entites/product_Entity.dart';

import '../../../Data_layer/model/product_response/Products.dart';
import '../../../domain_layer/repo_contract/product_repo_contract.dart';

@injectable
class ProductViewModel extends Cubit<ProductStates>{
  @factoryMethod
  ProductViewModel(this.productRepo):super(HomeTabInitialStates());
  ProductRepoContract productRepo ;



  GetProduct()async{
    emit(ProductLoadingStates());
    var result = await productRepo.getProducts();
    result.fold(
            (products){
          emit(ProductSuccessStates(products));
        },
            (Error){
          emit(ProductErrorStates(Error));
        });
  }
}

abstract class ProductStates{}
class HomeTabInitialStates extends ProductStates {}
class ProductLoadingStates extends ProductStates{}
class ProductSuccessStates extends ProductStates {
  List<ProductEntity> products;
  ProductSuccessStates(this.products);
}
class ProductErrorStates extends ProductStates{
  String Error;
  ProductErrorStates(this.Error);
}