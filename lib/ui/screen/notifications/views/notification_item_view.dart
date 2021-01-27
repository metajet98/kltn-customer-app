import 'package:customer_app/helpers/format_helper.dart';
import 'package:customer_app/models/notification/notification.dart' as model;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationItemView extends StatelessWidget {
  final model.Notification notification;

  const NotificationItemView({Key key, this.notification}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    notification.title ?? "",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    notification?.description ?? "",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FormatHelper.formatDateTime(notification.createdDate),
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
