import 'dart:io';

import 'package:customer_app/backend/services/topic_service.dart';
import 'package:customer_app/backend/services/utils_service.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:customer_app/ui/screen/topic_detail/bottom_sheet/reply_topic/reply_topic_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:get/get.dart';

@injectable
class ReplyTopicBottomSheetModel extends BaseViewModel<ReplyTopicBottomSheet> {
  int topicId;

  final TopicService topicService;
  final UtilsService utilsService;

  final _image = Rx<String>();

  String get image => _image.value;

  final contentInputController = TextEditingController();

  ReplyTopicBottomSheetModel(this.topicService, this.utilsService);

  Future onAddImagePressed() async {
    var pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    var file = File(pickedFile.path);
    call(() async {
      var result = await utilsService.uploadImage(file: file);
      _image.value = result.data as String;
    }, background: false, toastOnError: true);
  }

  void replyTopic() {
    var params = <String, dynamic>{
      "content": contentInputController.text,
      "image": image,
    };
    print(params);
    call(() async {
      await topicService.replyTopic(params: params, id: topicId);
      Get.back(result: true);
    }, toastOnError: true, background: false);
  }
}
