import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:intl/intl.dart';
import 'package:nhost_graphql_adapter/nhost_graphql_adapter.dart';

import '../../../api/api.dart';
import '../../../api/api_end_points.dart';
import '../../../api/api_utils.dart';
import '../../../data/graphql/graphql_logs.dart';
import '../../../data/models/logs_service_model.dart';
import '../../../shared/constants.dart';
import '../../../shared/utils/log_util.dart';

class LoggingController extends GetxController {
  final logTitle = "LoggingController";
  RxBool isLoading = true.obs;
  final logsList = <LogsList>[].obs;

  final offset = 0.obs;
  final limit = 50.obs;

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
      // logs list from postgres
      // final res = await apiUtils.post(
      //   url: "${Api.baseUrlLogs}${ApiEndPoints.logs}/list",
      //   data: LogsListRequest(
      //     limit: limit.value,
      //     offset: offset.value,
      //     criteria: LogsListRequestCriteria(
      //       createdBy: '',
      //     ),
      //   ).toJson(),
      // );
      // Log.loga(logTitle, 'listLogs:: res: ' + res.toString());
      // Log.loga(logTitle, 'listLogs:: res.data: ' + res.data.toString());
      // final logsListResponse = LogsListServiceResponse.fromJson(res.data);

      // final logsListModel = logsListResponse.data.rows;
      // for (var element in logsListModel) {
      //   logsList.add(LogsCreateResponse(
      //     createdAt: element.createdAt,
      //     createdBy: element.createdBy,
      //     detail: element.detail,
      //     id: element.id,
      //   ));
      // }
      // logs from graphql
      final graphqlClient = createNhostGraphQLClient(nhostClient);
      var result = await graphqlClient.query(
        QueryOptions(
          document: logsQuery,
          variables: {
            'limit': limit.value,
            'offset': (offset.value * limit.value)
          },
        ),
      );
      if (result.hasException) {
        Log.loga(logTitle, 'listProducts:: ${result.exception}');
      }
      final response = (result.data!['logs'] as List)
          .map((e) => LogsListResponseQuery.fromMap(e))
          .toList();
      for (var i = 0; i < response.length; i++) {
        logsList.value.add(LogsList(
          createdAt:
              DateFormat("dd-MM-yyyy hh:mm:ss").format(response[i].createdAt!),
          detail: response[i].detail,
        ));
      }
      // DateFormat("dd-MM-yyyy hh:mm:ss").format(new DateFormat("yyyy-MM-dd hh:mm:ss").parse(response[i].createdAt));
      // DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(response[i].createdAt);
      update();
      isLoading(false);
    } catch (e) {
      isLoading(false);
      Log.loga(logTitle, 'listLogs:: $e');
    }
    Log.loga(logTitle, 'listLogs:: end');
  }
}
