import 'package:graphql_flutter/graphql_flutter.dart';

final getDealers = gql(r'''
query MyQuery($dealerCode: String) {
  dealers(where: {dealer_code: {_regex: $dealerCode}}) {
    dealer_code
    name
  }
}
''');

final createDealers = gql(r'''
mutation CreateDealers($dealers: [dealers_insert_input!]!) {
  insert_dealers(objects: $dealers) {
    returning {
      id
      address
      name
      link_id
      phone
    }
    affected_rows
  }
}
''');

final getDealersSubscription = gql(r'''
subscription{
  dealers(distinct_on: name, order_by: {dealer_code: asc, name: asc}) {
    address
    dealer_code
    disabled
    id    
    name
    phone
  }
}
''');

final updateDealerStatus = gql(r'''
mutation MM($id: uuid!, $disabled: Boolean!, $updated_by: uuid!, $dealerCode: [jsonb!]) {  
  m1: update_dealers_by_pk(
    pk_columns: {id: $id}
    _set: {disabled: $disabled, updated_by: $updated_by}
  ) {
    id
  }
  m2: updateUsers(
    _set: {disabled: $disabled}
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

// user {
//       disabled
//     }
//     

