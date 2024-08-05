import 'package:cinema_craze/data/apis/models/specific_genres_response/specific_genre.dart';
import 'package:cinema_craze/data/repository_contract/specific_genres_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SpecificGenresListVM extends Cubit<SpecificGenresState> {
  late SpecificGenresRepository specificGenresRepository;
  @factoryMethod
  SpecificGenresListVM({required this.specificGenresRepository})
      : super(LoadingState(message: 'Loading..'));

  void fetchSpecificGenres(String genreId) async {
    try {
      var specificGenresList =
          await specificGenresRepository.getSpecificGenresList(genreId);
      emit(SuccessState(specificGenresList: specificGenresList));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class SpecificGenresState {}

class LoadingState extends SpecificGenresState {
  String message;
  LoadingState({required this.message});
}

class ErrorState extends SpecificGenresState {
  String? errorMessage;
  ErrorState({this.errorMessage});
}

class SuccessState extends SpecificGenresState {
  List<SpecificGenre>? specificGenresList;
  SuccessState({this.specificGenresList});
}
