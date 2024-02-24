class CreateTaskReqModel {
  final String name;
  final String description;
  final String deuDate;
  final int categoryId;
  final int status;

  CreateTaskReqModel({
    required this.name,
    required this.description,
    required this.deuDate,
    required this.categoryId,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'deu_date': deuDate,
      'category_id': categoryId,
      'status': status,
    };
  }
}
