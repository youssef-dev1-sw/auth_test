import 'package:auth_test/models/loginrequest.dart';
import 'package:auth_test/models/loginresponse.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'login_serv.g.dart';

@RestApi(baseUrl: 'https://numjshuvoezsiskjizdm.supabase.co')
abstract class LoginServ {
  factory LoginServ(Dio dio) = _LoginServ;
  @POST("/auth/v1/token?grant_type=password")
  Future<Loginresponse> login({@Body() required Loginrequest body});
}
