
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../utils/AppUrl.dart';
import '../../../../utils/Utils.dart';

part 'categories_event.dart';
part 'categories_state.dart';
var dio = Dio();

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<CategoriesEvent>((event, emit) async {emit(CategoriesLoadingState());
      try{
        final headers = {'Authorization': 'Bearer ${Utils.userkey}'};
        //final response=await dio.get(AppUrl.categories, options: Options(headers: headers));
        Response response = await dio.get(AppUrl.categories, options: Options(headers: headers));

        if (response.statusCode == 200) {
          emit(CategoriesLoadedState());
          Utils.categoriesList = response.data;
          if (kDebugMode) {
            print('auth value>>>${Utils.categoriesList}');
          }
        } else {
          if (kDebugMode) {
            print('data not found');
          }
        }
      }on DioError catch(e) {
        if (kDebugMode) {
          print(e.error);
        }
      }


    });
  }
}
