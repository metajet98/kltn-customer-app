import 'package:customer_app/models/maintenance/sparepart_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SparePartResultItemView extends StatelessWidget {
  final SparePartDetail sparePartDetail;

  const SparePartResultItemView({Key key, this.sparePartDetail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(sparePartDetail?.sparePartItem?.name ?? ""),
        Text(sparePartDetail?.status?.name ?? ""),
      ],
    );
  }
}
