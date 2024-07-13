import 'package:dartz/dartz.dart';
import '../model/product_response/Product_response.dart';

abstract class ProductDatasource {
 Future<Either<ProductResponse,String>> getProduct();
}