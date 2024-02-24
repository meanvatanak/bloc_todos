import 'package:bloc_todos_app/data/models/base_res_model.dart';

class CategoryResModel extends BaseResModel {
  late final List<CategoryResModelData> data;

  CategoryResModel.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data = List.from(json['data'])
        .map((e) => CategoryResModelData.fromJson(e))
        .toList();
  }
}

class CategoryResModelData {
  late final int id;
  late final String name;
  late final int userId;
  late final String user;
  late final int status;
  late final int deleteStatus;
  late final int? createdBy;
  late final int? updatedBy;
  late final int? deletedBy;
  late final String? createdAt;
  late final String? updatedAt;
  late final String? deletedAt;

  CategoryResModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['user_id'];
    user = json['user'];
    status = json['status'];
    deleteStatus = json['delete_status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedBy = json['deleted_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
}
