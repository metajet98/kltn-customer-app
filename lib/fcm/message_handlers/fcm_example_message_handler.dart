
import 'package:customer_app/fcm/fcm_payload.dart';
import 'package:customer_app/fcm/message_handlers/fcm_message_handler.dart';

class FcmExampleMessageHandler extends FcmMessageHandler {
  static const type = "example";

  @override
  void handle(FcmPayload payload) {
    throw UnimplementedError();
  }
}