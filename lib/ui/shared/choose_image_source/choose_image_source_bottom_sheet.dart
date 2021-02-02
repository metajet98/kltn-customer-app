import 'package:customer_app/generated/assets.gen.dart';
import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/my_bikes/bottom_sheet/add_bike/add_bike_bottom_sheet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChooseImageSourceBottomSheet extends StatelessWidget {
  static Future<ImageSource> show() => Get.bottomSheet(ChooseImageSourceBottomSheet());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 48),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Chọn nguồn",
              style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Divider(color: Colors.grey,),
            FlatButton(onPressed: () => Get.back(result: ImageSource.camera), child: Text("Camera")),
            Divider(color: Colors.grey,),
            FlatButton(onPressed: () => Get.back(result: ImageSource.gallery), child: Text("Thư viện"))
          ],
        ),
      ),
    );
  }
}
