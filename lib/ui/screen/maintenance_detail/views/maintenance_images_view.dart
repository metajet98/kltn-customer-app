import 'package:customer_app/models/maintenance/maintenance_image.dart';
import 'package:flutter/widgets.dart';

class MaintenanceImageView extends StatelessWidget {
  final List<MaintenanceImage> images;

  const MaintenanceImageView({Key key, this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hình ảnh", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Wrap(
            runSpacing: 16, spacing: 16,
            children: images
                .map((e) => Image.network(
                      e.imageUrl,
                      width: 100,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
