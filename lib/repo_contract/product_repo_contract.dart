import 'package:dartz/dartz.dart';

import '../Data_layer/model/product_response/Products.dart';


abstract class ProductRepoContract {
  Future<Either<List<Product>,String>> getProducts();
}