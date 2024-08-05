import 'package:cinema_craze/data/apis/models/genres_movies_response/Genres.dart';
import 'package:cinema_craze/data/apis/models/genres_movies_response/GenresMovieResponse.dart';
import 'package:cinema_craze/data/repository_contract/genres_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BrowseTabVM extends Cubit<BrowseTabState> {
  late GenresRepository genresRepository;
  @factoryMethod
  BrowseTabVM({required this.genresRepository})
      : super(LoadingState(message: 'Loading..'));

  void fetchGenresList() async {
    try {
      var genres = await genresRepository.getGenresList();
      emit(SuccessState(genresList: genres));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class BrowseTabState {}

class LoadingState extends BrowseTabState {
  String message;
  LoadingState({required this.message});
}

class ErrorState extends BrowseTabState {
  String? errorMessage;
  ErrorState({this.errorMessage});
}

class SuccessState extends BrowseTabState {
  List<Genres>? genresList;
  SuccessState({this.genresList});
}
