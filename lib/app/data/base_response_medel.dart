class BaseResponseModel {
  int statusCode;
  String? code;
  String? message;

  BaseResponseModel({
    required this.statusCode,
    this.code,
    this.message,
  });

  // BaseResponseModel.fromJson(Map<String, dynamic> json) {
  //   statusCode = json['status_code'];
  //   code = json['code'];
  //   message = json['message'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['status_code'] = this.statusCode;
  //   data['code'] = this.code;
  //   data['message'] = this.message;
  //   return data;
  // }
}
