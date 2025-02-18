import 'package:customer_app/backend/services/topic_service.dart';
import 'package:customer_app/models/topic/topic.dart';
import 'package:customer_app/ui/base/base_view_model.dart';
import 'package:customer_app/ui/screen/customer_care/bottom_sheet/create_topic/create_topic_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class CustomerCareScreenModel extends BaseViewModel {
  final _topics = RxList<Topic>();

  CustomerCareScreenModel(this.topicService);

  List<Topic> get topics => _topics.value;

  final TopicService topicService;


  @override
  void onInit() {
    loadTopic();
    super.onInit();
  }

  Future loadTopic({bool showLoading = true}) async {
    return call(() async {
      _topics.value = (await topicService.getAll()).data;
    }, toastOnError: true, background: !showLoading);
  }

  Future openCreateTopic() async {
    var result = await Get.bottomSheet(CreateTopicBottomSheet(), isScrollControlled: true);
    if(result != null) {
      loadTopic(showLoading: true);
    }
  }
}