import 'package:cinema_craze/data/apis/models/movie_similar_response/similar.dart';
import 'package:cinema_craze/data/repository_contract/movie_similar_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SimilarMoviesVM extends Cubit<SimilarMoviesState> {
  late SimilarMoviesRepo similarMoviesRepo;
  @factoryMethod
  SimilarMoviesVM({required this.similarMoviesRepo})
      : super(LoadingState(message: 'Loading..'));

  void fetchSimilarMovies(int movieId) async {
    try {
      var similar = await similarMoviesRepo.getSimilarMovies(movieId);
      emit(SuccessState(similarMoviesLis: similar));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class SimilarMoviesState {}

class LoadingState extends SimilarMoviesState {
  String message;
  LoadingState({required this.message});
}

class ErrorState extends SimilarMoviesState {
  String? errorMessage;
  ErrorState({this.errorMessage});
}

class SuccessState extends SimilarMoviesState {
  List<Similar>? similarMoviesLis;
  SuccessState({this.similarMoviesLis});
}