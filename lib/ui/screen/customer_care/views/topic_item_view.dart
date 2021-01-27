import 'package:customer_app/helpers/format_helper.dart';
import 'package:customer_app/models/topic/topic.dart';
import 'package:customer_app/ui/screen/topic_detail/topic_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TopicItemView extends StatelessWidget {
  final Topic topic;

  const TopicItemView({Key key, this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () => Get.to(TopicDetailScreen(topicId: topic.id)),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(topic.title ?? ""),
              SizedBox(height: 8),
              Text(
                FormatHelper.formatDateTime(topic.createdDate),
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
