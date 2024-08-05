import 'package:cinema_craze/data/apis/models/recommended_response/Results.dart';
import 'package:cinema_craze/data/datasource_impl/popular_datasource_impl.dart';
import 'package:cinema_craze/data/repository_impl/popular_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/apis/models/popular_response/popular.dart';
import '../../../data/repository_contract/popular_repository.dart';

@injectable
class PopularListVM extends Cubit<PopularListState> {
  late PopularRepository popularRepository;
  // late PopularDataSource popularDataSource;
  //late ApiManager apiManager;
  @factoryMethod
  PopularListVM({required this.popularRepository})
      : super(LoadingState(message: 'Loading...'));
  //apiManager = ApiManager();
  // popularDataSource = PopularDataSourceImpl(apiManager: apiManager);
  // popularRepository =
  //     PopularRepositoryImpl(popularDataSource: popularDataSource);

  void fetchPopular() async {
    try {
      var populars = await popularRepository.getPopular();
      emit(SuccessState(popularList: populars));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }

  void fetchRelease() async {
    try {
      var releases = await popularRepository.getRelease();
      emit(SuccessState(popularList: releases));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }

  void fetchRecommended() async {
    try {
      var recommended = await popularRepository.getRecommended();
      emit(SuccessState(recommendedList: recommended));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }

  void loadSearchMovie(String query) async {
    try {
      var result = await popularRepository.searchMovie(query);
      emit(SuccessState(popularList: result));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class PopularListState {}

class LoadingState extends PopularListState {
  String message;
  LoadingState({required this.message});
}

class ErrorState extends PopularListState {
  String? errorMessage;
  ErrorState({this.errorMessage});
}

class SuccessState extends PopularListState {
  List<Popular>? popularList;
  //List<Release>? releasedList;
  List<Results>? recommendedList;
  SuccessState({this.popularList, this.recommendedList});
}
