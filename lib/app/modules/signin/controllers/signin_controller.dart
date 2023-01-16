import 'dart:developer';
import 'package:graphql/client.dart';

import 'package:get/get.dart';
// import 'package:nhost_flutter_auth/nhost_flutter_auth.dart';
import 'package:nhost_graphql_adapter/nhost_graphql_adapter.dart';
import 'package:nhost_sdk/nhost_sdk.dart';

import '../../../api/services/logs_service.dart';
import '../../../data/graphql/graphql_logs.dart';
import '../../../data/models/logs_service_model.dart';
import '../../../shared/constants.dart';
import '../../../shared/utils/log_util.dart';

final title = "SigninController";

class SigninController extends GetxController {
  RxString signInError = ''.obs;

  @override
  void onInit() {
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

  Future<bool> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final authResponse = await nhostClient.auth
          .signInEmailPassword(email: email, password: password);
      if (authResponse.user != null) {
        // logs with postgres
        // final logsCreate = LogsCreateRequestModel(
        //     createdBy: authResponse.user!.id,
        //     detail: 'admin : $logActionLogin');
        // Log.loga(title, 'signInWithEmailPassword:: ${logsCreate.toJson()}');
        // final resultCreateLog = await LogsService().createLogs(logsCreate);

        // logs with nhost
        final graphqlClient = createNhostGraphQLClient(nhostClient);
        var mutationResult = await graphqlClient.mutate(
          MutationOptions(document: createLogs, variables: {
            'logs': LogsCreateRequestModel(
                createdBy: authResponse.user!.id,
                detail: 'admin : $logActionLogin')
          }),
        );
        Log.loga(title, 'signInWithEmailPassword:: logs: ${mutationResult}');
        return true;
      }
      return false;
      // return authResponse.user != null ? true : false;
    } on ApiException catch (e) {
      log('${e.responseBody['message']}');
      signInError.value = '${e.responseBody['message']}';
      return false;
    }
  }
}
