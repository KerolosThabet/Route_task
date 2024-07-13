import 'package:dartz/dartz.dart';
import 'package:route_task/domain_layer/Entites/product_Entity.dart';



abstract class ProductRepoContract {
  Future<Either<List<ProductEntity>,String>> getProducts();
}