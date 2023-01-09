import 'package:graphql_flutter/graphql_flutter.dart';

final createProductFileMutation = gql(r'''
mutation ProductFileMutation($product_id: uuid!, $file_id: uuid!) {
  insert_product_files_one(object: {product_id: $product_id, file_id: $file_id}){
    id
  }
}
''');
