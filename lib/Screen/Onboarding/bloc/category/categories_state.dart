part of 'categories_bloc.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}




class CategoriesLoadingState extends CategoriesState {
}

class CategoriesLoadedState extends CategoriesState {

}

class CategoriesErrorState extends CategoriesState {
  final String error;
  CategoriesErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

