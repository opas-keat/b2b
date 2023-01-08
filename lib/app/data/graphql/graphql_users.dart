import 'package:graphql_flutter/graphql_flutter.dart';

final getUserProfileSubscription = gql(r'''
subscription Profile{
  users{
    id
    avatarUrl    
    displayName
    disabled
  }
}
''');

final getUsersStatusSubscription = gql(r'''
subscription UsersStatus{
  users {
    disabled
  }
}
''');

final updateUserDisabledMutation = gql(r'''
mutation($dealerCode: [jsonb!], $status: Boolean!) {
  m2: updateUsers(
    _set: {disabled: $status}
    where: {metadata: {_in: $dealerCode}}
  ) {
    affected_rows
    returning {
      id
      email
      disabled
    }
  }
}
''');


// subscription DealersSubscription {
//   dealers(distinct_on: name, order_by: {dealer_code: asc, name: asc}) {
//     id
//     dealer_code
//     name
//     address
//     phone
//     disabled
//     user {
//       metadata(path: "dealerCode")
//     }
//   }
// }
