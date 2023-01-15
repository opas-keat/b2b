import 'package:get/get.dart';

import '../../../api/api.dart';
import '../../../api/api_end_points.dart';
import '../../../api/api_utils.dart';
import '../../../data/models/logs_service_model.dart';
import '../../../shared/utils/log_util.dart';

class LoggingController extends GetxController {
  final logTitle = "LoggingController";
  RxBool isLoading = true.obs;
  final logsList = <LogsCreateResponse>[].obs;

  final offset = 0.obs;
  final limit = 20.obs;

  @override
  void onInit() {
    listLogs();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  listLogs() async {
    Log.loga(logTitle, 'listLogs:: start');
    try {
      final res = await apiUtils.post(
        url: "${Api.baseUrlLogs}${ApiEndPoints.logs}/list",
        data: LogsListRequest(
          limit: limit.value,
          offset: offset.value,
          criteria: LogsListRequestCriteria(
            createdBy: '',
          ),
        ).toJson(),
      );
      Log.loga(logTitle, 'listLogs:: res: ' + res.toString());
      Log.loga(logTitle, 'listLogs:: res.data: ' + res.data.toString());
      final logsListResponse = LogsListServiceResponse.fromJson(res.data);

      final logsListModel = logsListResponse.data.rows;
      for (var element in logsListModel) {
        logsList.add(LogsCreateResponse(
          createdAt: element.createdAt,
          createdBy: element.createdBy,
          detail: element.detail,
          id: element.id,
        ));
      }
      update();
      isLoading(false);
    } catch (e) {
      isLoading(false);
      Log.loga(logTitle, 'listLogs:: $e');
    }
    Log.loga(logTitle, 'listLogs:: end');
  }
}
