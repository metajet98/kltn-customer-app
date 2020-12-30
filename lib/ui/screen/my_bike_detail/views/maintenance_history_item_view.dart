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
              Text("Bảo dưỡng định kì", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
              SizedBox(height: 4),
              Text(maintenance.branch?.name),
              SizedBox(height: 4),
              Text(FormatHelper.formatDateTime(maintenance.createdDate), style: TextStyle(fontSize: 12, color: Colors.grey),)
            ],
          ),
        ),
      ),
    );
  }
}
