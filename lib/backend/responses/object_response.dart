import 'package:customer_app/converters/generic_type_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'object_response.g.dart';

@JsonSerializable()
class ObjectResponse<T> {
  @JsonKey(name: "data")
  @GenericTypeConverter()
  T data;
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "statusCode")
  int statusCode;
  @JsonKey(name: "isSuccess")
  bool isSuccess;
  @JsonKey(name: "trace_log")
  dynamic traceLog;

  ObjectResponse(this.data, this.message, this.statusCode, this.isSuccess, this.traceLog);

  factory ObjectResponse.fromJson(Map<String, dynamic> json) => _$ObjectResponseFromJson<T>(json);

  Map<String, dynamic> toJson() => _$ObjectResponseToJson(this);
}
