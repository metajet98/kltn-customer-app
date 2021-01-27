import 'package:customer_app/helpers/format_helper.dart';
import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/topic_detail/bottom_sheet/reply_topic/reply_topic_bottom_sheet.dart';
import 'package:customer_app/ui/screen/topic_detail/topic_detail_screen_model.dart';
import 'package:customer_app/ui/screen/topic_detail/views/reply_view.dart';
import 'package:customer_app/ui/shared/list_view/easy_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TopicDetailScreen extends BaseView<TopicDetailScreenModel> {
  TopicDetailScreen({int topicId}) {
    viewModel.topicId = topicId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Obx(() => Text(
              viewModel.topic?.title ?? "Hỏi đáp",
              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
            )),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => viewModel.loadData(showLoading: false),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => Text(
                                  (viewModel.topic?.user?.fullName ?? "") + " (Tác giả)",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                              SizedBox(height: 8),
                              Obx(() => Text(FormatHelper.formatDateTime(viewModel.topic?.createdDate) ?? "")),
                              SizedBox(height: 8),
                              Obx(
                                () => TextField(
                                  maxLines: 50,
                                  minLines: 1,
                                  enabled: false,
                                  decoration: InputDecoration(
                                      hintText:
                                          viewModel?.topic?.content ?? "",
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(1), gapPadding: 0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Obx(
                        () => EasyListView(
                          primary: false,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: viewModel.topic?.topicReply?.length ?? 0,
                          itemBuilder: (ctx, index) => ReplyView(
                            topicReply: viewModel.topic.topicReply[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          FlatButton(
            minWidth: Get.width,
            onPressed: () => viewModel.openReply(),
            child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "Trả lời",
                  style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                )),
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
