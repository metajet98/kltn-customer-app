import 'package:customer_app/generated/assets.gen.dart';
import 'package:customer_app/models/vehicle/vehicle.dart';
import 'package:customer_app/ui/screen/my_bike_detail/my_bike_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBikeItemView extends StatelessWidget {
  final Vehicle vehicle;

  MyBikeItemView(this.vehicle);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => Get.to(MyBikeDetailScreen(userVehicleId: vehicle.id)),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(100),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(vehicle?.vehicleGroup?.image ?? "", width: 75, height: 75),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    vehicle?.name ?? vehicle?.vehicleGroup?.name ?? "",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text("Biển số: ${vehicle?.plateNumber ?? ""}"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
