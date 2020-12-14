import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BranchDetailBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text("Cửa hàng Honda Bình Minh Quận 12"),
          Text("Địa chỉ: Lê Văn Khương, Phường Hiệp Thành, Quận 12"),
        ],
      ),
    );
  }
}
