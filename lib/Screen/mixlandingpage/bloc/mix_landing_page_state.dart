part of 'mix_landing_page_bloc.dart';

@immutable
abstract class MixLandingPageState {}

class MixLandingPageInitial extends MixLandingPageState {}


class UserLoadingState extends MixLandingPageState {
  final List  oldPosts;
  final bool isFirstFetch;
  UserLoadingState(this.oldPosts, {this.isFirstFetch=false});
}

class UserLoadedState extends MixLandingPageState {
  final List posts;

  UserLoadedState(this.posts);
}

class UserErrorState extends MixLandingPageState {
  final String error;
  UserErrorState(this.error);
  @override
  List<Object?> get props => [error];
}