import 'package:bloc_todos_app/data/models/base_res_model.dart';

class TaskResModel extends BaseResModel {
  late final List<TaskResModelData> data;

  TaskResModel.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data = List.from(json['data'])
        .map((e) => TaskResModelData.fromJson(e))
        .toList();
  }
}

class TaskResModelData {
  late final int id;
  late final String name;
  late final String description;
  late final String deuDate;
  late final int categoryId;
  late final int userId;
  late final int status;
  late final int deleteStatus;
  late final int? createdBy;
  late final int? updatedBy;
  late final int? deletedBy;
  late final String? createdAt;
  late final String? updatedAt;
  late final String? deletedAt;
  late final String category;
  late final String user;

  TaskResModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    deuDate = json['deu_date'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    status = json['status'];
    deleteStatus = json['delete_status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedBy = json['deleted_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    category = json['category'];
    user = json['user'];
  }
}
