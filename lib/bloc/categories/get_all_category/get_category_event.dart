part of 'get_category_bloc.dart';

abstract class GetCategoryEvent extends Equatable {
  const GetCategoryEvent();
}

class GetAllCategory extends GetCategoryEvent {
  @override
  List<Object> get props => [];
}
