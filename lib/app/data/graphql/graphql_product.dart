import 'package:graphql_flutter/graphql_flutter.dart';

final createProductMutation = gql(r'''
mutation CreateProductsMutation($product: products_insert_input!) {
  insert_products_one(object: $product){
    id
  }
}
''');

final productsQuery = gql(r'''
query productsQuery($limit: Int!, $offset: Int!) {
  products(order_by: {created_at: desc_nulls_first}, limit: $limit, offset: $offset) {
    id
    name
    price
  }
}
''');

final productDetailQuery = gql(r'''
query productDetailQuery {
  products(order_by: {created_at: desc_nulls_first}) {
    id
    brand
    model
    code
    color
    mat_size
    name
    offset
    pitch_circle_code
    price
    tread_ware
    width
    dealer_price_1
    group_code
    link_id
  }
}
''');

final listBrandAndModelQuery = gql(r'''
query listBrandAndModelQuery($distinct_on: [products_select_column!] = [brand,model]) {
  products(where: {}, distinct_on: $distinct_on) {
    id
    brand
    model
  }
}
''');
