class UserResModel {
  UserResModel({
    required this.id,
    required this.username,
    required this.phone,
    required this.gender,
    required this.image,
    required this.email,
    this.verifiedAt,
    required this.token,
    required this.name,
    required this.address,
    required this.roleId,
    required this.themeId,
    required this.status,
    required this.deleteStatus,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
    this.deletedBy,
  });

  late final int id;
  late final String username;
  late final String phone;
  late final String gender;
  late final String? image;
  late final String email;
  late final String? verifiedAt;
  late final String? token;
  late final String name;
  late final String? address;
  late final int roleId;
  late final int themeId;
  late final int status;
  late final int deleteStatus;
  late final String? createdAt;
  late final int? createdBy;
  late final String? updatedAt;
  late final int? updatedBy;
  late final String? deletedAt;
  late final int? deletedBy;

  UserResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    phone = json['phone'];
    gender = json['gender'];
    image = json['image'];
    email = json['email'];
    verifiedAt = json['verified_at'];
    token = json['token'];
    name = json['name'];
    address = json['address'];
    roleId = json['role_id'];
    themeId = json['theme_id'];
    status = json['status'];
    deleteStatus = json['delete_status'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    deletedAt = json['deleted_at'];
    deletedBy = json['deleted_by'];
  }

  // toJson method
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['phone'] = phone;
    _data['gender'] = gender;
    _data['image'] = image;
    _data['email'] = email;
    _data['verified_at'] = verifiedAt;
    _data['token'] = token;
    _data['name'] = name;
    _data['address'] = address;
    _data['role_id'] = roleId;
    _data['theme_id'] = themeId;
    _data['status'] = status;
    _data['delete_status'] = deleteStatus;
    _data['created_at'] = createdAt;
    _data['created_by'] = createdBy;
    _data['updated_at'] = updatedAt;
    _data['updated_by'] = updatedBy;
    _data['deleted_at'] = deletedAt;
    _data['deleted_by'] = deletedBy;
    return _data;
  }
}
