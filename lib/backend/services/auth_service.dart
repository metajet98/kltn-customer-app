import 'package:customer_app/backend/http_client.dart';
import 'package:customer_app/configs/backend_config.dart';
import 'package:customer_app/locator.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'auth_service.g.dart';

@lazySingleton
@RestApi(baseUrl: "${BackendConfig.BASE_URL}/api")
abstract class AuthService {
  @factoryMethod
  factory AuthService() => _AuthService(locator<HttpClient>().dio);

  @POST("/login")
  Future<void> login({@Field("PhoneNumber") String phoneNumber, @Field("Password") String password});
}
