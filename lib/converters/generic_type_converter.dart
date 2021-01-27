import 'package:customer_app/models/branch/branch.dart';
import 'package:customer_app/models/maintenance/bill_detail.dart';
import 'package:customer_app/models/maintenance/maintenance.dart';
import 'package:customer_app/models/maintenance/schedule.dart';
import 'package:customer_app/models/maintenance/sparepart_detail.dart';
import 'package:customer_app/models/maintenance/sparepart_item.dart';
import 'package:customer_app/models/maintenance/status.dart';
import 'package:customer_app/models/notification/banner.dart';
import 'package:customer_app/models/notification/news.dart';
import 'package:customer_app/models/notification/notification.dart';
import 'package:customer_app/models/topic/topic.dart';
import 'package:customer_app/models/topic/topic_image.dart';
import 'package:customer_app/models/topic/topic_reply.dart';
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

    if(json is! Map<String, dynamic>) {
      return json as T;
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
      case Maintenance:
        return Maintenance.fromJson(map) as T;
      case Branch:
        return Branch.fromJson(map) as T;
      case BillDetail:
        return BillDetail.fromJson(map) as T;
      case SparePartDetail:
        return SparePartDetail.fromJson(map) as T;
      case SparePartItem:
        return SparePartItem.fromJson(map) as T;
      case Status:
        return Status.fromJson(map) as T;
      case Schedule:
        return Schedule.fromJson(map) as T;
      case Topic:
        return Topic.fromJson(map) as T;
      case TopicImage:
        return TopicImage.fromJson(map) as T;
      case TopicReply:
        return TopicReply.fromJson(map) as T;
      case News:
        return News.fromJson(map) as T;
      case Banner:
        return Banner.fromJson(map) as T;
      case Notification:
        return Notification.fromJson(map) as T;
    }
    return map as T;
  }

  @override
  Map<String, dynamic> toJson(T object) {
    return object as Map<String, dynamic>;
  }
}
