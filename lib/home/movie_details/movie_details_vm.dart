import 'package:cinema_craze/data/apis/models/movie_details_response/MovieDetailsResponse.dart';
import 'package:cinema_craze/data/repository_contract/movie_details_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieDetailsVM extends Cubit<MovieDetailsState> {
  late MovieDetailsRepository movieDetailsRepository;
  @factoryMethod
  MovieDetailsVM({required this.movieDetailsRepository})
      : super(LoadingState(message: 'Loading..'));

  void fetchMovieDetails(int movieId) async {
    try {
      var details = await movieDetailsRepository.getMovieDetails(movieId);
      emit(SuccessState(details: details));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class MovieDetailsState {}

class LoadingState extends MovieDetailsState {
  String message;
  LoadingState({required this.message});
}

class ErrorState extends MovieDetailsState {
  String? errorMessage;
  ErrorState({this.errorMessage});
}

class SuccessState extends MovieDetailsState {
  MovieDetailsResponse? details;
  SuccessState({this.details});
}
