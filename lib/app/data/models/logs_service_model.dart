import 'dart:convert';

// class LogsListServiceResponse {
//   LogsListServiceResponse({
//     required this.statusCode,
//     required this.code,
//     required this.message,
//     required this.data,
//   });

//   int statusCode;
//   String code;
//   String message;
//   LogsListResponse data;

//   factory LogsListServiceResponse.fromMap(Map<String, dynamic> json) =>
//       LogsListServiceResponse(
//         statusCode: json["status_code"],
//         code: json["code"],
//         message: json["message"],
//         data: LogsListResponse.fromMap(json["data"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "status_code": statusCode,
//         "code": code,
//         "message": message,
//         "data": data.toMap(),
//       };

//   factory LogsListServiceResponse.fromJson(Map<String, dynamic> json) =>
//       LogsListServiceResponse(
//         statusCode: json["status_code"],
//         code: json["code"],
//         message: json["message"],
//         data: LogsListResponse.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "status_code": statusCode,
//         "code": code,
//         "message": message,
//         "data": data.toJson(),
//       };
// }

// class LogsListResponse {
//   LogsListResponse({
//     required this.rows,
//     required this.totalCount,
//   });

//   List<LogsList> rows;
//   int totalCount;

//   factory LogsListResponse.fromMap(Map<String, dynamic> json) =>
//       LogsListResponse(
//         rows: List<LogsList>.from(json["rows"].map((x) => LogsList.fromMap(x))),
//         totalCount: json["total_count"],
//       );

//   Map<String, dynamic> toMap() => {
//         "rows": List<dynamic>.from(rows.map((x) => x.toMap())),
//         "total_count": totalCount,
//       };

//   factory LogsListResponse.fromJson(Map<String, dynamic> json) =>
//       LogsListResponse(
//         rows:
//             List<LogsList>.from(json["rows"].map((x) => LogsList.fromJson(x))),
//         totalCount: json["total_count"],
//       );

//   Map<String, dynamic> toJson() => {
//         "rows": List<dynamic>.from(rows.map((x) => x.toJson())),
//         "total_count": totalCount,
//       };
// }

// class LogsList {
//   LogsList({
//     required this.id,
//     required this.detail,
//     required this.createdAt,
//     required this.createdBy,
//   });

//   String id;
//   String detail;
//   String createdAt;
//   String createdBy;

//   factory LogsList.fromMap(Map<String, dynamic> json) => LogsList(
//         id: json["id"],
//         detail: json["detail"],
//         createdAt: json["created_at"],
//         createdBy: json["created_by"],
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "detail": detail,
//         "created_at": createdAt,
//         "created_by": createdBy,
//       };

//   factory LogsList.fromJson(Map<String, dynamic> json) => LogsList(
//         id: json["id"],
//         detail: json["detail"],
//         createdAt: json["created_at"],
//         createdBy: json["created_by"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "detail": detail,
//         "created_at": createdAt,
//         "created_by": createdBy,
//       };
// }

class LogsCreateRequestModel {
  LogsCreateRequestModel({
    required this.createdBy,
    required this.detail,
  });

  String createdBy;
  String detail;

  factory LogsCreateRequestModel.fromMap(Map<String, dynamic> json) =>
      LogsCreateRequestModel(
        createdBy: json["created_by"],
        detail: json["detail"],
      );

  Map<String, dynamic> toMap() => {
        "created_by": createdBy,
        "detail": detail,
      };

  factory LogsCreateRequestModel.fromJson(Map<String, dynamic> json) =>
      LogsCreateRequestModel(
        createdBy: json["created_by"],
        detail: json["detail"],
      );

  Map<String, dynamic> toJson() => {
        "created_by": createdBy,
        "detail": detail,
      };
}

class LogsCreateResponseModel {
  LogsCreateResponseModel({
    required this.statusCode,
    required this.code,
    required this.message,
    required this.data,
  });

  int? statusCode;
  String? code;
  String? message;
  LogsCreateResponse? data;

  LogsCreateResponseModel.withError({
    this.statusCode,
    String? msg,
  }) : message = msg;

  factory LogsCreateResponseModel.fromJson(Map<String, dynamic> json) =>
      LogsCreateResponseModel(
        statusCode: json["status_code"],
        code: json["code"],
        message: json["message"],
        data: LogsCreateResponse.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "code": code,
        "message": message,
        "data": data,
      };
}

class LogsCreateResponse {
  LogsCreateResponse({
    required this.id,
    required this.detail,
    required this.createdAt,
    required this.createdBy,
  });

  String id;
  String detail;
  String createdAt;
  String createdBy;

  factory LogsCreateResponse.fromJson(Map<String, dynamic> json) =>
      LogsCreateResponse(
        id: json["id"],
        detail: json["detail"],
        createdAt: json["created_at"],
        createdBy: json["created_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "detail": detail,
        "created_at": createdAt,
        "created_by": createdBy,
      };

  factory LogsCreateResponse.fromMap(Map<String, dynamic> json) =>
      LogsCreateResponse(
        id: json["id"],
        detail: json["detail"],
        createdAt: json["created_at"],
        createdBy: json["created_by"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "detail": detail,
        "created_at": createdAt,
        "created_by": createdBy,
      };
}

class LogsListRequest {
  LogsListRequest({
    required this.criteria,
    required this.limit,
    required this.offset,
  });

  LogsListRequestCriteria criteria;
  int limit;
  int offset;

  factory LogsListRequest.fromJson(Map<String, dynamic> json) =>
      LogsListRequest(
        criteria: LogsListRequestCriteria.fromJson(json["criteria"]),
        limit: json["limit"],
        offset: json["offset"],
      );

  Map<String, dynamic> toJson() => {
        "criteria": criteria.toJson(),
        "limit": limit,
        "offset": offset,
      };
}

class LogsListRequestCriteria {
  LogsListRequestCriteria({
    required this.createdBy,
  });

  String createdBy;

  factory LogsListRequestCriteria.fromJson(Map<String, dynamic> json) =>
      LogsListRequestCriteria(
        createdBy: json["created_by"],
      );

  Map<String, dynamic> toJson() => {
        "created_by": createdBy,
      };
}

class LogsListResponseQuery {
  LogsListResponseQuery({
    required this.detail,
    required this.createdAt,
  });

  String? detail;
  DateTime? createdAt;

  factory LogsListResponseQuery.fromMap(Map<String, dynamic> json) =>
      LogsListResponseQuery(
        detail: json["detail"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "detail": detail,
        "created_at": createdAt!.toIso8601String(),
      };
}

class LogsList {
  LogsList({
    required this.detail,
    required this.createdAt,
  });

  String? detail;
  String? createdAt;

  factory LogsList.fromMap(Map<String, dynamic> json) => LogsList(
        detail: json["detail"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toMap() => {
        "detail": detail,
        "created_at": createdAt,
      };
}
