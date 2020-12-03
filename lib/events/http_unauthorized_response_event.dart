import 'package:customer_app/backend/http_error.dart';

class HttpUnauthorizedResponseEvent {
  final HttpError error;

  HttpUnauthorizedResponseEvent(this.error);
}