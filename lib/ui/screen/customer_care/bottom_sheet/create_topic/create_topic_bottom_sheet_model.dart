import 'dart:io';

import 'package:customer_app/backend/services/topic_service.dart';
import 'package:customer_app/backend/services/utils_service.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:customer_app/ui/screen/customer_care/bottom_sheet/create_topic/create_topic_bottom_sheet.dart';
import 'package:customer_app/ui/shared/choose_image_source/choose_image_source_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:get/get.dart';

@injectable
class CreateTopicBottomSheetModel extends BaseViewModel<CreateTopicBottomSheet> {
  final TopicService topicService;
  final UtilsService utilsService;

  final _images = RxList<String>([]);

  List<String> get images => _images.value;

  final titleInputController = TextEditingController();
  final contentInputController = TextEditingController();

  CreateTopicBottomSheetModel(this.topicService, this.utilsService);

  Future onAddImagePressed() async {
    var source = await ChooseImageSourceBottomSheet.show();
    if(source == null) return;
    var pickedFile = await ImagePicker().getImage(source: source);
    if (pickedFile == null) return;
    var file = File(pickedFile.path);
    call(() async {
      var result = await utilsService.uploadImage(file: file);
      _images.add(result.data as String);
    }, background: false, toastOnError: true);
  }

  void removeImage(String url) {
    _images.removeWhere((element) => element == url);
    _images.refresh();
  }

  void createTopic() {
    var params = <String, dynamic>{"title": titleInputController.text, "content": contentInputController.text, "images": images};
    print(params);
    call(() async {
      await topicService.createTopic(params: params);
      Get.back(result: true);
    }, toastOnError: true, background: false);
  }
}
