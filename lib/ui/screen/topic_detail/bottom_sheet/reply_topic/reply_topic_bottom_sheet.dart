import 'package:customer_app/generated/assets.gen.dart';
import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/customer_care/bottom_sheet/create_topic/create_topic_bottom_sheet_model.dart';
import 'package:customer_app/ui/screen/topic_detail/bottom_sheet/reply_topic/reply_topic_bottom_sheet_model.dart';
import 'package:customer_app/ui/shared/preview_image/preview_image_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ReplyTopicBottomSheet extends BaseView<ReplyTopicBottomSheetModel> {
  ReplyTopicBottomSheet(int topicId) {
    viewModel.topicId = topicId;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 48),
            child: Material(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white,
              elevation: 5,
              child: Container(
                padding: EdgeInsets.only(top: 48, right: 16, left: 16, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Trả lời",
                      style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 32),
                    Row(
                      children: [
                        Text("Đính kèm ảnh:"),
                        SizedBox(width: 8),
                        Obx(
                            () => Wrap(
                            children: _buildImageWidgets(),
                            spacing: 8,
                            runSpacing: 8,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    TextField(
                      minLines: 3,
                      maxLines: 10,
                      controller: viewModel.contentInputController,
                      decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelText: "Nội dung",
                          border: new OutlineInputBorder(
                            gapPadding: 0,
                            borderRadius: const BorderRadius.all(const Radius.circular(20)),
                          ),
                          hintText: "Nhập nội dung",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14)),
                    ),
                    SizedBox(height: 16),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () => viewModel.replyTopic(),
                      child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "Tạo",
                            style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                          )),
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Material(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              color: Colors.white,
              child: ClipRRect(
                child: Container(
                  width: 96,
                  height: 96,
                  child: Hero(
                    tag: "ic_logo",
                    child: Assets.resources.images.icLogo.image(fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildImageWidgets() {
    var result = <Widget>[];
    if (!viewModel.image.isNullOrBlank) {
      result.add(Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 5,
        child: SizedBox(
          width: 100,
          height: 50,
          child: GestureDetector(
            onLongPress: () => viewModel.removeImage(),
            onTap: () => PreviewImagePage.start(imageUrl: viewModel.image),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                viewModel.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ));
    }
    result.add(Material(
      borderRadius: BorderRadius.circular(50),
      elevation: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: viewModel.onAddImagePressed,
        child: Container(
          width: 50,
          height: 50,
          child: Icon(Icons.add, color: Colors.blueAccent),
        ),
      ),
    ));
    return result;
  }
}
