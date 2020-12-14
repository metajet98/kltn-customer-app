import 'package:customer_app/models/user/user.dart';
import 'package:customer_app/models/vehicle/vehicle.dart';
import 'package:customer_app/models/vehicle/vehicle_company.dart';
import 'package:customer_app/models/vehicle/vehicle_group.dart';
import 'package:customer_app/models/vehicle/vehicle_type.dart';
import 'package:json_annotation/json_annotation.dart';

class GenericTypeConverter<T> implements JsonConverter<T, Object> {
  const GenericTypeConverter();

  @override
  T fromJson(Object json) {
    if (json is List) {
      return json.isNotEmpty
          ? json?.map((e) => GenericTypeConverter<T>().fromJson(e as Map<String, dynamic>))?.toList()?.first
          : null;
    }

    final map = json as Map<String, dynamic>;

    switch (T) {
      case User:
        return User.fromJson(map) as T;
      case VehicleGroup:
        return VehicleGroup.fromJson(map) as T;
      case VehicleType:
        return VehicleType.fromJson(map) as T;
      case VehicleCompany:
        return VehicleCompany.fromJson(map) as T;
      case Vehicle:
        return Vehicle.fromJson(map) as T;
    }
    return map as T;
  }

  @override
  Map<String, dynamic> toJson(T object) {
    return object as Map<String, dynamic>;
  }
}
