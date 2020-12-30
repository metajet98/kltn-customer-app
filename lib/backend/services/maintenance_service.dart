import 'package:customer_app/backend/http_client.dart';
import 'package:customer_app/backend/responses/array_response.dart';
import 'package:customer_app/backend/responses/object_response.dart';
import 'package:customer_app/configs/backend_config.dart';
import 'package:customer_app/locator.dart';
import 'package:customer_app/models/maintenance/maintenance.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'maintenance_service.g.dart';

@lazySingleton
@RestApi(baseUrl: "${BackendConfig.BASE_URL}/api/maintenance")
abstract class MaintenanceService {
  @factoryMethod
  factory MaintenanceService() => _MaintenanceService(locator<HttpClient>().dio);

  @GET("")
  Future<ArrayResponse<Maintenance>> getAllMaintenance({@Query("userVehicleId") int userVehicleId});

  @GET("/{maintenanceId}")
  Future<ObjectResponse<Maintenance>> getMaintenance({@Path("maintenanceId") int maintenanceId});
}
