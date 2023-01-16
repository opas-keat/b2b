import 'package:graphql_flutter/graphql_flutter.dart';

final createLogs = gql(r'''
mutation LogsMutation($logs: logs_insert_input!) {
  insert_logs_one(object: $logs) {
    id
  }
}
''');

final logsQuery = gql(r'''
query LogsQuery($offset: Int!, $limit: Int!) {
  logs(order_by: {created_at: desc}, limit: $limit, offset: $offset) {
    detail
    created_at
  }
}
''');
