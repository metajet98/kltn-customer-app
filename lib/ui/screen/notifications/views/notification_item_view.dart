import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationItemView extends StatelessWidget {
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
                    "Bảo dưỡng xe",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Bạn vừa được tạo 1 lượt bảo dưỡng tại cửa hàng Honda Bình Minh Quận 12",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateTime.now().toString(),
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        "Xem chi tiết",
                        textAlign: TextAlign.end,
                      )
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
