// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;
import 'package:oruphones/core/module.dart' as _i9;
import 'package:oruphones/features/home/presentation/cubit/home/home_cubit.dart'
    as _i8;
import 'package:oruphones/features/home/repository/home_repository.dart' as _i6;
import 'package:oruphones/features/home/repository/i_home_repository.dart'
    as _i5;
import 'package:oruphones/features/search/presentation/cubit/search_cubit.dart'
    as _i7;

const String _prod = 'prod';

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
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Dio>(
      () => registerModule.dioProd,
      registerFor: {_prod},
    );
    gh.lazySingleton<_i4.Logger>(
      () => registerModule.loggerProd,
      registerFor: {_prod},
    );
    gh.lazySingleton<_i5.IHomeRepository>(() => _i6.HomeRepository(
          gh<_i3.Dio>(),
          gh<_i4.Logger>(),
        ));
    gh.factory<_i7.SearchCubit>(
        () => _i7.SearchCubit(gh<_i5.IHomeRepository>()));
    gh.factory<_i8.HomeCubit>(() => _i8.HomeCubit(gh<_i5.IHomeRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
