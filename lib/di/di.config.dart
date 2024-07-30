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
import '../data/datasource_contract/popular_datasource.dart' as _i4;
import '../data/datasource_impl/popular_datasource_impl.dart' as _i5;
import '../data/repository_contract/popular_repository.dart' as _i6;
import '../data/repository_impl/popular_repository_impl.dart' as _i7;
import '../home/home_tab/popular_fragmant/popular_list_view_model.dart' as _i8;

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
    gh.factory<_i4.PopularDataSource>(
        () => _i5.PopularDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i6.PopularRepository>(() => _i7.PopularRepositoryImpl(
        popularDataSource: gh<_i4.PopularDataSource>()));
    gh.factory<_i8.PopularListVM>(() =>
        _i8.PopularListVM(popularRepository: gh<_i6.PopularRepository>()));
    return this;
  }
}
