import 'package:customer_app/backend/http_client.dart';
import 'package:customer_app/backend/responses/object_response.dart';
import 'package:customer_app/configs/backend_config.dart';
import 'package:customer_app/locator.dart';
import 'package:customer_app/models/user/user.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'user_service.g.dart';

@lazySingleton
@RestApi(baseUrl: "${BackendConfig.BASE_URL}/api/user")
abstract class UserService {
  @factoryMethod
  factory UserService() => _UserService(locator<HttpClient>().dio);

  @GET("/self")
  Future<ObjectResponse<User>> self();
}
