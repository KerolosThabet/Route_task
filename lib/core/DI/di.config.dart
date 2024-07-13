// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../Data_layer/DataSource_contract/product_dataSource.dart' as _i4;
import '../../Data_layer/DataSource_Impl/product_DataSource_impl.dart' as _i5;
import '../../Data_layer/repo_impl/product_repo_impl.dart' as _i7;
import '../../domain_layer/repo_contract/product_repo_contract.dart' as _i6;
import '../../domain_layer/Usecase/proudct_usecase.dart' as _i8;
import '../../Presentation_layer/Home/View_model/home_viewModel.dart' as _i9;
import '../api/api_manager.dart' as _i3;

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
    gh.factory<_i4.ProductDatasource>(
        () => _i5.ProductDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.ProductRepoContract>(
        () => _i7.ProductRepoImpl(gh<_i4.ProductDatasource>()));
    gh.factory<_i8.ProductUseCase>(
        () => _i8.ProductUseCase(gh<_i6.ProductRepoContract>()));
    gh.factory<_i9.ProductViewModel>(
        () => _i9.ProductViewModel(gh<_i6.ProductRepoContract>()));
    return this;
  }
}
