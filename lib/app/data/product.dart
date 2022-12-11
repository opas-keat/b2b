class Product {
  String fNMSysProdId;
  String fTProdCode;
  String fTProdNameTH;
  String fTProdImage;
  String categoryId;
  int fNDealerPrice1;
  int priceCredit;
  int fNPrice;
  int fNQuantityBal;

  Product({
    required this.fNMSysProdId,
    required this.fTProdCode,
    required this.fTProdNameTH,
    required this.fTProdImage,
    required this.categoryId,
    required this.fNDealerPrice1,
    required this.priceCredit,
    required this.fNPrice,
    required this.fNQuantityBal,
  });
}
