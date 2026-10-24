
import 'package:auth_test/models/loginrequest.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'regestir_serv.g.dart';

@RestApi(baseUrl: 'https://numjshuvoezsiskjizdm.supabase.co')

abstract class RegestirServ {
  factory RegestirServ(Dio dio)=_RegestirServ;

  @POST('/auth/v1/signup')

  Future<dynamic> regestir({@Body() required Loginrequest body});
}