import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/Data_layer/model/product_response/Products.dart';
import 'package:route_task/domain_layer/Entites/product_Entity.dart';

import '../../domain_layer/repo_contract/product_repo_contract.dart';
import '../DataSource_contract/product_dataSource.dart';

@Injectable(as: ProductRepoContract)
class ProductRepoImpl extends ProductRepoContract{
  ProductDatasource apiDatasource;
  @factoryMethod
  ProductRepoImpl(this.apiDatasource);
  @override
  Future<Either<List<ProductEntity>, String>> getProducts() async {
    var result = await apiDatasource.getProduct();
    return result.fold((response) {
      var productListModel = response.products ?? [];
      var product = productListModel.map((product) => product.toProductEntity() ).toList();
      return Left(product);
    }, (error) {
      return Right(error);
    }
    );
  }

}