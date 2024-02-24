part of 'get_category_bloc.dart';

abstract class GetCategoryState extends Equatable {
  const GetCategoryState();
}

class GetCategoryInitial extends GetCategoryState {
  @override
  List<Object> get props => [];
}

class GetCategoryLoading extends GetCategoryState {
  @override
  List<Object> get props => [];
}

class GetCategorySuccess extends GetCategoryState {
  final CategoryResModel categoryResModel;

  GetCategorySuccess(this.categoryResModel);

  @override
  List<Object> get props => [categoryResModel];
}

class GetCategoryFailed extends GetCategoryState {
  final String message;

  GetCategoryFailed(this.message);

  @override
  List<Object> get props => [message];
}
