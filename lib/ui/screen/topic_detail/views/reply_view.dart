import 'package:customer_app/helpers/format_helper.dart';
import 'package:customer_app/models/topic/topic_reply.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReplyView extends StatelessWidget {
  final TopicReply topicReply;

  const ReplyView({Key key, this.topicReply}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 48, top: 16),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(topicReply?.user?.fullName ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  SizedBox(width: 8),
                  Text(FormatHelper.formatDateTime(topicReply?.createdDate) ?? "")
                ],
              ),
              SizedBox(height: 8),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: topicReply.content ?? "",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    gapPadding: 0
                  )
                ),
              ),
              SizedBox(height: 8),
              if(topicReply.image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(topicReply.image),
                )
            ],
          ),
        ),
      ),
    );
  }
}
