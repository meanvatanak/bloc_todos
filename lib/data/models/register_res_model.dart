class RegisterResModel {
  RegisterResModel({
    required this.message,
    required this.statusCode,
    required this.user,
  });

  late final String message;
  late final int statusCode;
  late final RegisterUserModel user;

  RegisterResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    user = RegisterUserModel.fromJson(json['user']);
  }
}

class RegisterUserModel {
  RegisterUserModel({
    required this.name,
    required this.phone,
    required this.gender,
    required this.email,
    required this.address,
    required this.roleId,
    required this.username,
    required this.themeId,
    required this.status,
    required this.createdAt,
    required this.id,
    required this.role,
  });

  late final String name;
  late final String phone;
  late final String gender;
  late final String email;
  late final String address;
  late final int roleId;
  late final String username;
  late final int themeId;
  late final int status;
  late final String? createdAt;
  late final int id;
  late final Role role;

  RegisterUserModel.fromJson(Map<String, dynamic> json) {
    name = json['full_name'];
    phone = json['phone'];
    gender = json['gender'];
    email = json['email'];
    address = json['address'];
    roleId = json['role_id'];
    username = json['username'];
    themeId = json['theme_id'];
    status = json['status'];
    createdAt = json['created_at'];
    id = json['id'];
    role = Role.fromJson(json['role']);
  }
}

class Role {
  Role({
    required this.id,
    required this.roleName,
    this.remark,
    required this.status,
    required this.deleteStatus,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  late final int id;
  late final String roleName;
  late final String? remark;
  late final int status;
  late final int deleteStatus;
  late final int? createdBy;
  late final int? updatedBy;
  late final int? deletedBy;
  late final String? createdAt;
  late final String? updatedAt;
  late final String? deletedAt;

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleName = json['role_name'];
    remark = json['remark'];
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
