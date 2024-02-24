import 'package:bloc/bloc.dart';
import 'package:bloc_todos_app/Exceptions/common_errors.dart';
import 'package:bloc_todos_app/data/repositories/category_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/category_res_model.dart';

part 'get_category_event.dart';
part 'get_category_state.dart';

class GetCategoryBloc extends Bloc<GetCategoryEvent, GetCategoryState> {
  final CategoryRepository categoryRepository = CategoryRepository();

  GetCategoryBloc() : super(GetCategoryInitial()) {
    on<GetAllCategory>((event, emit) async {
      try {
        emit(GetCategoryLoading());
        final CategoryResModel categoryResModel =
            await categoryRepository.getAllCategories();
        emit(GetCategorySuccess(categoryResModel));
      } on BadRequestException catch (e) {
        emit(GetCategoryFailed(e.message));
      } on UnauthorisedException catch (e) {
        emit(GetCategoryFailed(e.message));
      } catch (e) {
        emit(GetCategoryFailed(e.toString()));
      }
    });
  }
}
