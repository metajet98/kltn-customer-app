import 'package:customer_app/helpers/format_helper.dart';
import 'package:customer_app/models/calender/calender.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ScheduleItemView extends StatelessWidget {
  final Calender calender;
  final Function(int id) onDelete;

  const ScheduleItemView({Key key, this.calender, this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    calender.notes ?? "Hẹn bảo dưỡng",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(FormatHelper.formatDateTime(calender?.time) ?? ""),
                  SizedBox(
                    height: 4,
                  ),
                  getStatusText(calender?.status),
                  SizedBox(
                    height: 4,
                  ),
                  if(!GetUtils.isNullOrBlank(calender?.review))
                    Text("Lý do: ${calender.review}")
                ],
              ),
            ),
            SizedBox(width: 8),
            FlatButton(
              onPressed: () => onDelete(calender.id),
              child: Text(
                "Huỷ",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }

  Text getStatusText(int status) {
    if(status == 1) return Text("Đã duyệt", style: TextStyle(color: Colors.green));
    else if(status == 2) return Text("Bị từ chối", style: TextStyle(color: Colors.red));
    else if(status == null) return Text("Đang chờ duyệt");
  }
}
