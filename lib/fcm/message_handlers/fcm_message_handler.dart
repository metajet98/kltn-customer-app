import 'package:customer_app/fcm/fcm_payload.dart';

abstract class FcmMessageHandler {
  FcmMessageHandler();

  void handle(FcmPayload payload);
}