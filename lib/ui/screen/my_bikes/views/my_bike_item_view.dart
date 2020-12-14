import 'package:flutter/material.dart';

class MyBikeItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(16),
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(width: 60, height: 60, color: Colors.red),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("SH MODE 2020", style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 4),
                Text("Biển số: 61F1-22522"),
                SizedBox(height: 2),
                Text("Số khung: 123123123132"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
