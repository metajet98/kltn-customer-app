import 'package:customer_app/constaints/constaints.dart';
import 'package:customer_app/helpers/format_helper.dart';
import 'package:customer_app/models/maintenance/maintenance.dart';
import 'package:customer_app/ui/screen/maintenance_detail/maintenance_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MaintenanceHistoryItemView extends StatelessWidget {
  final Maintenance maintenance;

  const MaintenanceHistoryItemView({Key key, this.maintenance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => Get.to(MaintenanceDetailScreen(maintenanceId: maintenance.id)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                maintenance.title ?? "Bảo dưỡng",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(maintenance.branch?.name),
              SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    FormatHelper.formatDateTime(maintenance.createdDate),
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Spacer(),
                  Text(
                    "Trạng thái: ",
                    style: TextStyle(fontSize: 12),
                  ),
                  _buildStatusText(maintenance.status)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildStatusText(int status) {
    switch (status) {
      case maintenanceCreated:
        {
          return Text(
            "Mới nhận xe",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          );
        }
      case underMaintenance:
        {
          return Text(
            "Đang bảo dưỡng",
            style: TextStyle(fontSize: 12, color: Colors.red),
          );
        }
      case maintenanceFinish:
        {
          return Text(
            "Kết thúc",
            style: TextStyle(fontSize: 12, color: Colors.green),
          );
        }
    }
  }
}
