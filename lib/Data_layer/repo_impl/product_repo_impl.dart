import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/Data_layer/model/product_response/Products.dart';
import 'package:route_task/repo_contract/product_repo_contract.dart';

import '../DataSource_contract/product_dataSource.dart';

@Injectable(as: ProductRepoContract)
class ProductRepoImpl extends ProductRepoContract{
  ProductDatasource apiDatasource;
  @factoryMethod
  ProductRepoImpl(this.apiDatasource);
  @override
  Future<Either<List<Product>, String>> getProducts() async {
    var result = await apiDatasource.getProduct();
    return result.fold((response) {
      var productListModel = response.products ?? [];
      return Left(productListModel);
    }, (error) {
      return Right(error);
    }
    );
  }

}