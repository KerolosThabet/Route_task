import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../Entites/product_Entity.dart';
import '../repo_contract/product_repo_contract.dart';

@injectable
class ProductUseCase {
  ProductRepoContract productsRepo ;
  @factoryMethod
  ProductUseCase(this.productsRepo);

  Future<Either<List<ProductEntity>, String>> Call(){
    return productsRepo.getProducts();
  }
}