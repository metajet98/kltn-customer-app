import 'package:customer_app/backend/http_client.dart';
import 'package:customer_app/backend/responses/array_response.dart';
import 'package:customer_app/backend/responses/object_response.dart';
import 'package:customer_app/configs/backend_config.dart';
import 'package:customer_app/locator.dart';
import 'package:customer_app/models/calender/calender.dart';
import 'package:customer_app/models/maintenance/schedule.dart';
import 'package:customer_app/models/vehicle/vehicle.dart';
import 'package:customer_app/models/vehicle/vehicle_company.dart';
import 'package:customer_app/models/vehicle/vehicle_group.dart';
import 'package:customer_app/models/vehicle/vehicle_type.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'calender_service.g.dart';

@lazySingleton
@RestApi(baseUrl: "${BackendConfig.BASE_URL}/api/calender")
abstract class CalenderService {
  @factoryMethod
  factory CalenderService() => _CalenderService(locator<HttpClient>().dio);

  @GET("")
  Future<ArrayResponse<Calender>> getCalender({@Query("UserId") int userId, @Query("BranchId") int branchId});

  @POST("")
  Future<void> createCalender({@Body() Map<String, dynamic> params});
}