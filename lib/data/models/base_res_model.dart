class BaseResModel {
  BaseResModel({
    required this.message,
    required this.statusCode,
    required this.page,
    required this.pageSize,
    required this.totalCount,
    required this.totalPages,
  });

  late final String message;
  late final int statusCode;
  late final int page;
  late final String pageSize;
  late final int totalCount;
  late final int totalPages;

  BaseResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    page = json['page'];
    pageSize = json['pageSize'];
    totalCount = json['totalCount'];
    totalPages = json['totalPages'];
  }
}
