// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/apis/api_manager/api_manager.dart' as _i3;
import '../data/datasource_contract/genres_datasource.dart' as _i10;
import '../data/datasource_contract/movie_details_ds.dart' as _i8;
import '../data/datasource_contract/movie_similar_ds.dart' as _i4;
import '../data/datasource_contract/popular_datasource.dart' as _i6;
import '../data/datasource_contract/specific_genres_datasource.dart' as _i12;
import '../data/datasource_impl/genres_datasource_impl.dart' as _i11;
import '../data/datasource_impl/movie_details_ds_impl.dart' as _i9;
import '../data/datasource_impl/movie_similar_ds_impl.dart' as _i5;
import '../data/datasource_impl/popular_datasource_impl.dart' as _i7;
import '../data/datasource_impl/specific_genres_datasource_impl.dart' as _i13;
import '../data/repository_contract/genres_repo.dart' as _i18;
import '../data/repository_contract/movie_details_repo.dart' as _i16;
import '../data/repository_contract/movie_similar_repo.dart' as _i14;
import '../data/repository_contract/popular_repository.dart' as _i21;
import '../data/repository_contract/specific_genres_repo.dart' as _i24;
import '../data/repository_impl/genres_repo_impl.dart' as _i19;
import '../data/repository_impl/movie_details_repo_impl.dart' as _i17;
import '../data/repository_impl/movie_similar_repo_impl.dart' as _i15;
import '../data/repository_impl/popular_repository_impl.dart' as _i22;
import '../data/repository_impl/specific_genres_repo_impl.dart' as _i25;
import '../home/browse_tab_widget/browse_tab_vm.dart' as _i23;
import '../home/browse_tab_widget/specific_genres/specific_genres_list_vm.dart'
    as _i28;
import '../home/home_tab/popular_fragmant/popular_list_view_model.dart' as _i26;
import '../home/movie_details/movie_details_vm.dart' as _i27;
import '../home/movie_details/similar_movies/similar_movies_vm.dart' as _i20;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.SimilarMoviesDS>(
        () => _i5.SimilarMoviesDsImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i6.PopularDataSource>(
        () => _i7.PopularDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i8.MovieDetailsDS>(
        () => _i9.MovieDetailsDSImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i10.GenresDataSource>(
        () => _i11.GenresDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i12.SpecificGenresDataSource>(
        () => _i13.SpecificGenresDSImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i14.SimilarMoviesRepo>(() =>
        _i15.SimilarMoviesRepoImpl(similarMoviesDS: gh<_i4.SimilarMoviesDS>()));
    gh.factory<_i16.MovieDetailsRepository>(() =>
        _i17.MovieDetailsRepoImpl(movieDetailsDS: gh<_i8.MovieDetailsDS>()));
    gh.factory<_i18.GenresRepository>(() => _i19.GenresRepositoryImpl(
        genresDataSource: gh<_i10.GenresDataSource>()));
    gh.factory<_i20.SimilarMoviesVM>(() =>
        _i20.SimilarMoviesVM(similarMoviesRepo: gh<_i14.SimilarMoviesRepo>()));
    gh.factory<_i21.PopularRepository>(() => _i22.PopularRepositoryImpl(
        popularDataSource: gh<_i6.PopularDataSource>()));
    gh.factory<_i23.BrowseTabVM>(
        () => _i23.BrowseTabVM(genresRepository: gh<_i18.GenresRepository>()));
    gh.factory<_i24.SpecificGenresRepository>(() => _i25.SpecificGenresRepoImpl(
        specificGenresDataSource: gh<_i12.SpecificGenresDataSource>()));
    gh.factory<_i26.PopularListVM>(() =>
        _i26.PopularListVM(popularRepository: gh<_i21.PopularRepository>()));
    gh.factory<_i27.MovieDetailsVM>(() => _i27.MovieDetailsVM(
        movieDetailsRepository: gh<_i16.MovieDetailsRepository>()));
    gh.factory<_i28.SpecificGenresListVM>(() => _i28.SpecificGenresListVM(
        specificGenresRepository: gh<_i24.SpecificGenresRepository>()));
    return this;
  }
}
