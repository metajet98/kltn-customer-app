import 'dart:io';

import 'package:customer_app/backend/responses/object_response.dart';
import 'package:customer_app/configs/backend_config.dart';
import 'package:customer_app/locator.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:customer_app/backend/http_client.dart';

part 'utils_service.g.dart';

@lazySingleton
@RestApi(baseUrl: "${BackendConfig.BASE_URL}/api/utils")
abstract class UtilsService {
  @factoryMethod
  factory UtilsService() => _UtilsService(locator<HttpClient>().dio);

  @POST("/image")
  Future<ObjectResponse<dynamic>> uploadImage({@Part(name: "file") File file});
}
