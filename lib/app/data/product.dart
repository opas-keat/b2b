class Product {
  String id;
  String title;
  String image;
  String categoryId;
  double price;
  double priceCredit;
  double priceSuggest;
  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.categoryId,
    required this.price,
    required this.priceCredit,
    required this.priceSuggest,
  });
}

class Category {
  String id;
  String title;
  Category({
    required this.id,
    required this.title,
  });
}
