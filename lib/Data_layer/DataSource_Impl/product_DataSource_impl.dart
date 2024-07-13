import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/Data_layer/DataSource_contract/product_dataSource.dart';
import 'package:route_task/Data_layer/model/product_response/Product_response.dart';
import 'package:route_task/shared/api/EndPoints.dart';
import 'package:route_task/shared/api/api_manager.dart';

@Injectable(as:ProductDatasource )
class ProductDatasourceImpl extends ProductDatasource {
  ApiManager apiManager;
  @factoryMethod
  ProductDatasourceImpl(this.apiManager);

  @override
  Future<Either<ProductResponse, String>> getProduct() async {
    try{
      var response = await apiManager.getRequest(endPoint: EndPoint.ProductsEndPoint)
    ;
      return Left(ProductResponse.fromJson(response.data));
    }catch(error){
      return Right(error.toString());
    }
  }
}