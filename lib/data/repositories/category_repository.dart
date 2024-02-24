import '../models/category_res_model.dart';
import '../services/category_service.dart';

class CategoryRepository {
  final CategoryService categoryApiClient = CategoryService();

  Future<CategoryResModel> getAllCategories() async {
    final CategoryResModel categoryResModel =
        await categoryApiClient.getAllCategory();
    // print(categoryResModel);
    return categoryResModel;
  }
}
