import 'package:customer_app/backend/http_client.dart';
import 'package:customer_app/backend/responses/array_response.dart';
import 'package:customer_app/backend/responses/object_response.dart';
import 'package:customer_app/configs/backend_config.dart';
import 'package:customer_app/locator.dart';
import 'package:customer_app/models/topic/topic.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'topic_service.g.dart';

@lazySingleton
@RestApi(baseUrl: "${BackendConfig.BASE_URL}/api/topic")
abstract class TopicService {
  @factoryMethod
  factory TopicService() => _TopicService(locator<HttpClient>().dio);

  @GET("")
  Future<ArrayResponse<Topic>> getAll({@Query("CreatedUserId") int createdUserId});

  @GET("/{id}")
  Future<ObjectResponse<Topic>> get({@Path("id") int id});

  @POST("")
  Future<ObjectResponse<void>> createTopic({@Body() Map<String, dynamic> params});

  @POST("/{id}/reply")
  Future<ObjectResponse<void>> replyTopic({@Path("id") int id, @Body() Map<String, dynamic> params});
}
