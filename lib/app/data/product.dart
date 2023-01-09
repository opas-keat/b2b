import 'dart:convert';

List<Product2> sampleProducts = [
  Product2(
    fNMSysProdId: "210340020",
    fTProdCode: "1855516DLTYLM75",
    fTProdNameTH: "ยาง DUNLOP LM705 185-55-16",
    fTProdImage: "assets/images/car-tries.JPG",
    categoryId: "1",
    fNDealerPrice1: 50,
    priceCredit: 55,
    fNPrice: 60,
    fNQuantityBal: 10,
  ),
  Product2(
    fNMSysProdId: "210340021",
    fTProdCode: "2853520ZTTY07SL",
    fTProdNameTH: "ยาง ZESTINO 285-35-20 GREDGE 07RS (SILVER)",
    fTProdImage: "assets/images/car-tries.JPG",
    categoryId: "1",
    fNDealerPrice1: 50,
    priceCredit: 55,
    fNPrice: 60,
    fNQuantityBal: 2,
  ),
  Product2(
    fNMSysProdId: "210400001",
    fTProdCode: "2457016LLD20000",
    fTProdNameTH: "ยาง LINGLONG 245-70-16  (D2)",
    fTProdImage: "assets/images/car-tries.JPG",
    categoryId: "1",
    fNDealerPrice1: 40,
    priceCredit: 55,
    fNPrice: 60,
    fNQuantityBal: 10,
  ),
  Product2(
    fNMSysProdId: "210420001",
    fTProdCode: "2355018YK00AE61",
    fTProdNameTH: "ยาง YOKOHAMA BLUEARTH AE61 235-50-18",
    fTProdImage: "assets/images/car-tries.JPG",
    categoryId: "1",
    fNDealerPrice1: 50,
    priceCredit: 55,
    fNPrice: 60,
    fNQuantityBal: 10,
  ),
  Product2(
    fNMSysProdId: "210480001",
    fTProdCode: "2656517RSD20000",
    fTProdNameTH: "ยาง ROADSTONE  265-65-17  (D2)",
    fTProdImage: "assets/images/car-tries.JPG",
    categoryId: "1",
    fNDealerPrice1: 40,
    priceCredit: 55,
    fNPrice: 60,
    fNQuantityBal: 3,
  ),
  Product2(
    fNMSysProdId: "210570002",
    fTProdCode: "1955516BSD20000",
    fTProdNameTH: "ยาง BRIDGESTONE 195-55-16  (D2)",
    fTProdImage: "assets/images/car-tries.JPG",
    categoryId: "1",
    fNDealerPrice1: 40,
    priceCredit: 55,
    fNPrice: 60,
    fNQuantityBal: 10,
  ),
  Product2(
    fNMSysProdId: "210370003",
    fTProdCode: "F6R0ABGTD69DA25",
    fTProdNameTH:
        "แม็กซ์ FATTAH/F6-R(YA033) 18X9.5 6X139.7 ET25 CB.106 B-LPTG-WTG-PLATE  (สีดำ+ขอบไดร์ทอง+CNCข้างก้านไดร์ทอง+เพลท)",
    fTProdImage: "assets/images/car-tries.JPG",
    categoryId: "1",
    fNDealerPrice1: 25,
    priceCredit: 55,
    fNPrice: 60,
    fNQuantityBal: 2,
  ),
  Product2(
    fNMSysProdId: "210360004",
    fTProdCode: "3760LFRBLTGC040",
    fTProdNameTH:
        "แม็กซ์ VESA(376) 17X7.5 10X100/114.3 ET40 CB.73.1 *B-P/FACERED*  (สีหน้าไดร์แดง+ร่องดำ)Custom",
    fTProdImage: "assets/images/car-wheel.PNG",
    categoryId: "2",
    fNDealerPrice1: 15,
    priceCredit: 55,
    fNPrice: 60,
    fNQuantityBal: 10,
  ),
  Product2(
    fNMSysProdId: "210350008",
    fTProdCode: "MUZ0GPDSV5NFA32",
    fTProdNameTH:
        "แม็กซ์ M-UZ 20X9.0 5X113 ET32 CB.73 BRUSHED/SILVER  (สีหน้าปัดลายซิลเวอร์)",
    fTProdImage: "assets/images/car-wheel.PNG",
    categoryId: "2",
    fNDealerPrice1: 5,
    priceCredit: 55,
    fNPrice: 60,
    fNQuantityBal: 10,
  )
  // Product(
  //   fNMSysProdId: "10",
  //   fTProdCode: "1",
  //   fTProdNameTH: "ก๋วยเตี๋ยว",
  //   fTProdImage: "https://via.placeholder.com/150",
  //   categoryId: "3",
  //   fNDealerPrice1: 40,
  //   priceCredit: 55,
  //   fNPrice: 60,
  //   fNQuantityBal: 1,
  // ),
  // Product(
  //   fNMSysProdId: "11",
  //   fTProdCode: "1",
  //   fTProdNameTH: "เย็นตาโฟ",
  //   fTProdImage: "https://via.placeholder.com/150",
  //   categoryId: "3",
  //   fNDealerPrice1: 50,
  //   priceCredit: 55,
  //   fNPrice: 60,
  //   fNQuantityBal: 10,
  // ),
  // Product(
  //   fNMSysProdId: "12",
  //   fTProdCode: "1",
  //   fTProdNameTH: "เกาหลา",
  //   fTProdImage: "https://via.placeholder.com/150",
  //   categoryId: "3",
  //   fNDealerPrice1: 50,
  //   priceCredit: 55,
  //   fNPrice: 60,
  //   fNQuantityBal: 10,
  // ),
  // Product(
  //   fNMSysProdId: "13",
  //   fTProdCode: "1",
  //   fTProdNameTH: "ข้าวเปล่า",
  //   fTProdImage: "https://via.placeholder.com/150",
  //   categoryId: "3",
  //   fNDealerPrice1: 20,
  //   priceCredit: 55,
  //   fNPrice: 60,
  //   fNQuantityBal: 10,
  // )
];

class Product2 {
  String fNMSysProdId;
  String fTProdCode;
  String fTProdNameTH;
  String fTProdImage;
  String categoryId;
  int fNDealerPrice1;
  int priceCredit;
  int fNPrice;
  int fNQuantityBal;

  Product2({
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

class ProductResponseModel {
  int? statusCode;
  String? code;
  String? message;
  Product? data;

  ProductResponseModel({this.statusCode, this.code, this.message, this.data});

  ProductResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Product.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Product {
  String? id = '';
  String? code;
  String? name;
  String? matSize;
  String? color;
  String? brand;
  String? model;
  String? width;
  String? offset;
  String? treadWare;
  String? pitchCircleCode;
  int? price;
  int? dealerPrice1;
  String? groupCode;

  Product(
      {this.id,
      this.code,
      this.name,
      this.matSize,
      this.color,
      this.brand,
      this.model,
      this.width,
      this.offset,
      this.treadWare,
      this.pitchCircleCode,
      this.price,
      this.dealerPrice1,
      this.groupCode});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    matSize = json['mat_size'];
    color = json['color'];
    brand = json['brand'];
    model = json['model'];
    width = json['width'];
    offset = json['offset'];
    treadWare = json['tread_ware'];
    pitchCircleCode = json['pitch_circle_code'];
    price = json['price'];
    dealerPrice1 = json['dealer_price_1'];
    groupCode = json['group_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['mat_size'] = matSize;
    data['color'] = color;
    data['brand'] = brand;
    data['model'] = model;
    data['width'] = width;
    data['offset'] = offset;
    data['tread_ware'] = treadWare;
    data['pitch_circle_code'] = pitchCircleCode;
    data['price'] = price;
    data['dealer_price_1'] = dealerPrice1;
    data['group_code'] = groupCode;
    return data;
  }
}

class ProductBrandAndModelRequestModel {
  ProductBrandAndModelCriteria? criteria;
  int? limit;
  int? offset;

  ProductBrandAndModelRequestModel({this.criteria, this.limit, this.offset});

  ProductBrandAndModelRequestModel.fromJson(Map<String, dynamic> json) {
    criteria = json['criteria'] != null
        ? ProductBrandAndModelCriteria.fromJson(json['criteria'])
        : null;
    limit = json['limit'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (criteria != null) {
      data['criteria'] = criteria!.toJson();
    }
    data['limit'] = limit;
    data['offset'] = offset;
    return data;
  }
}

class ProductBrandAndModelCriteria {
  String? productType;

  ProductBrandAndModelCriteria({this.productType});

  ProductBrandAndModelCriteria.fromJson(Map<String, dynamic> json) {
    productType = json['product_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_type'] = productType;
    return data;
  }
}

class ProductBrandAndModelResponseModel {
  int? statusCode;
  String? code;
  String? message;
  BrandAndModelList? data;

  ProductBrandAndModelResponseModel(
      {this.statusCode, this.code, this.message, this.data});

  ProductBrandAndModelResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    code = json['code'];
    message = json['message'];
    data =
        json['data'] != null ? BrandAndModelList.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class BrandAndModelList {
  List<BrandAndModel>? rows;
  int? totalCount;

  BrandAndModelList({this.rows, this.totalCount});

  BrandAndModelList.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      rows = <BrandAndModel>[];
      json['rows'].forEach((v) {
        rows!.add(BrandAndModel.fromJson(v));
      });
    }
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rows != null) {
      data['rows'] = rows!.map((v) => v.toJson()).toList();
    }
    data['total_count'] = totalCount;
    return data;
  }
}

class BrandAndModel {
  String? brand;
  String? model;

  BrandAndModel({this.brand, this.model});

  BrandAndModel.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    model = json['model'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand'] = brand;
    data['model'] = model;
    return data;
  }
}

class ProductInsert {
  String? linkId;
  String? code;
  String? name;
  String? matSize;
  String? color;
  String? brand;
  String? model;
  String? width;
  String? offset;
  String? treadWare;
  String? pitchCircleCode;
  int? price;
  int? dealerPrice1;
  String? groupCode;
  String? createdBy;

  ProductInsert({
    this.linkId,
    this.code,
    this.name,
    this.matSize,
    this.color,
    this.brand,
    this.model,
    this.width,
    this.offset,
    this.treadWare,
    this.pitchCircleCode,
    this.price,
    this.dealerPrice1,
    this.groupCode,
    this.createdBy,
  });

  factory ProductInsert.fromJson(Map<String, dynamic> json) => ProductInsert(
        linkId: json['link_id'],
        code: json['code'],
        name: json['name'],
        matSize: json['mat_size'],
        color: json['color'],
        brand: json['brand'],
        model: json['model'],
        width: json['width'],
        offset: json['offset'],
        treadWare: json['tread_ware'],
        pitchCircleCode: json['pitch_circle_code'],
        price: json['price'],
        dealerPrice1: json['dealer_price_1'],
        groupCode: json['group_code'],
        createdBy: json["created_by"],
      );

  Map<String, dynamic> toJson() => {
        'link_id': linkId,
        'code': code,
        'name': name,
        'mat_size': matSize,
        'color': color,
        'brand': brand,
        'model': model,
        'width': width,
        'offset': offset,
        'tread_ware': treadWare,
        'pitch_circle_code': pitchCircleCode,
        'price': price,
        'dealer_price_1': dealerPrice1,
        'group_code': groupCode,
        'created_by': createdBy,
      };
}

BrandAndModelResponseQuery brandAndModelResponseQueryFromJson(String str) =>
    BrandAndModelResponseQuery.fromJson(json.decode(str));

String brandAndModelResponseQueryToJson(BrandAndModelResponseQuery data) =>
    json.encode(data.toJson());

class BrandAndModelResponseQuery {
  BrandAndModelResponseQuery({
    required this.id,
    required this.brand,
    required this.model,
  });

  String id;
  String brand;
  String model;

  factory BrandAndModelResponseQuery.fromJson(Map<String, dynamic> json) =>
      BrandAndModelResponseQuery(
        id: json["id"],
        brand: json["brand"],
        model: json["model"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "model": model,
      };
  factory BrandAndModelResponseQuery.fromMap(Map<String, dynamic> json) =>
      BrandAndModelResponseQuery(
        id: json["id"],
        brand: json["brand"],
        model: json["model"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "brand": brand,
        "model": model,
      };
}
