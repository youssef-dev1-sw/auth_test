
import 'package:auth_test/models/product_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';


part 'product_serv.g.dart';

@RestApi(baseUrl:"https://numjshuvoezsiskjizdm.supabase.co/rest/v1/")

abstract class ProductServ {
  factory ProductServ(Dio dio)=_ProductServ;

  @POST('products')

  Future<void> productUser({@Body() required ProductRequest body});
}