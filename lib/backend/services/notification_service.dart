import 'dart:io';

import 'package:customer_app/backend/responses/array_response.dart';
import 'package:customer_app/backend/responses/object_response.dart';
import 'package:customer_app/configs/backend_config.dart';
import 'package:customer_app/locator.dart';
import 'package:customer_app/models/notification/banner.dart';
import 'package:customer_app/models/notification/news.dart';
import 'package:customer_app/models/notification/notification.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:customer_app/backend/http_client.dart';

part 'notification_service.g.dart';

@lazySingleton
@RestApi(baseUrl: "${BackendConfig.BASE_URL}/api")
abstract class NotificationService {
  @factoryMethod
  factory NotificationService() => _NotificationService(locator<HttpClient>().dio);

  @GET("/news")
  Future<ArrayResponse<News>> getNews();

  @GET("/banners")
  Future<ArrayResponse<Banner>> getBanners();

  @GET("/notifications")
  Future<ArrayResponse<Notification>> getNotifications();
}
