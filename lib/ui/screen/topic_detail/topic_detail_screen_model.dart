import 'package:customer_app/backend/services/topic_service.dart';
import 'package:customer_app/models/topic/topic.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:customer_app/ui/screen/topic_detail/topic_detail_screen.dart';
import 'package:injectable/injectable.dart';
import 'package:get/get.dart';

import 'bottom_sheet/reply_topic/reply_topic_bottom_sheet.dart';

@injectable
class TopicDetailScreenModel extends BaseViewModel<TopicDetailScreen> {
  int topicId;

  final TopicService topicService;

  final _topic = Rx<Topic>();

  Topic get topic => _topic.value;

  TopicDetailScreenModel(this.topicService);

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future loadData({bool showLoading = true}) {
    return call(() async {
      _topic.value = (await topicService.get(id: topicId)).data;
    }, background: !showLoading, toastOnError: true);
  }

  Future openReply() async {
    var result = await Get.bottomSheet(ReplyTopicBottomSheet(topicId), isScrollControlled: true);
    if(result != null) loadData(showLoading: true);
  }
}
