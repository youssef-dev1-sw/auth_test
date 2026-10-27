
import 'package:auth_test/models/getproduct_model.dart';
import 'package:auth_test/models/product_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'getproduct_serv.g.dart';

@RestApi(baseUrl:"https://numjshuvoezsiskjizdm.supabase.co/rest/v1/")
abstract class GetproductServ {
  factory GetproductServ(Dio dio)=_GetproductServ;

  @GET('products')
    Future<List<GetproductModel>> getProductUser();
}