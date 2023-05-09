

// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:core';


import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';


import 'data/posts_service.dart';



part 'mix_landing_page_event.dart';
part 'mix_landing_page_state.dart';

class MixLandingPageBloc extends Bloc<MixLandingPageEvent, MixLandingPageState> {


  MixLandingPageBloc(this.repository) : super(MixLandingPageInitial());
    int page = 1;
    final PostsService repository;

    void loadPosts() {
      if (state is UserLoadingState) return;

      final currentState = state;

      var oldPosts = [];
      if (currentState is UserLoadedState) {
        oldPosts = currentState.posts;
      }

      emit(UserLoadingState(oldPosts, isFirstFetch: page == 1));


      repository.fetchPosts(page).then((newPosts) {
        page++;

        final posts = (state as UserLoadingState).oldPosts;
        posts.addAll(newPosts);

        emit(UserLoadedState(posts));
      });
    }
    /*on<MixLandingPageEvent>((event, emit) async {emit(UserLoadingState());

      try {
        Response response = await dio.get(
            "${AppUrl.products_render_info}"
                "?searchCriteria[filterGroups][0][filters][0][field]=category_id"
                "&searchCriteria[filterGroups][0][filters][0][value]=4"
                "&searchCriteria[filterGroups][0][filters][0][conditionType]=eq"
                "&searchCriteria[pageSize]=${_pageSize}"
                "&searchCriteria[currentPage]=5"
                "&storeId=0"
                "&currencyCode=INR");
        if (response.statusCode == 200) {
          Utils.ProdRendInfoModel = response.data;
         // print('response.data--- ${response.data}');
        }
        emit(UserLoadedState());
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });*/






}
