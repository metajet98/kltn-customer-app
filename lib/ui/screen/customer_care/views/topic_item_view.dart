import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopicItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Xe tôi bị hỏng máy, cần đặt lịch bảo dưỡng tại ..."),
            SizedBox(height: 8),
            Text(
              DateTime.now().toString(),
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
