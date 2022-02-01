// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:drift/drift.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/matricule/matricule_bloc.dart' as _i9;
import '../bloc/ot/ot_bloc.dart' as _i6;
import '../bloc/site/sites_bloc.dart' as _i10;
import '../models/bdd/iomer_database.dart' as _i4;
import '../models/repository/in_repository.dart' as _i8;
import '../models/repository/local_repository.dart' as _i5;
import '../models/repository/out_repository.dart' as _i7;
import '../models/repository/registermodule.dart' as _i11;

const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.QueryExecutor>(registerModule.queryExecutor);
  gh.singleton<_i4.IomerDatabase>(_i4.IomerDatabase(get<_i3.QueryExecutor>()),
      registerFor: {_prod});
  gh.singleton<_i5.LocalRepository>(
      _i5.LocalRepository(get<_i4.IomerDatabase>()),
      registerFor: {_prod});
  gh.factory<_i6.OtBloc>(() => _i6.OtBloc(get<_i5.LocalRepository>()),
      registerFor: {_prod});
  gh.singleton<_i7.OutRepository>(_i7.OutRepository(get<_i4.IomerDatabase>()),
      registerFor: {_prod});
  gh.singleton<_i8.InRepository>(
      _i8.InRepository(get<_i4.IomerDatabase>(), get<_i5.LocalRepository>()),
      registerFor: {_prod});
  gh.factory<_i9.MatriculeBloc>(
      () => _i9.MatriculeBloc(
          get<_i5.LocalRepository>(), get<_i8.InRepository>()),
      registerFor: {_prod});
  gh.factory<_i10.SitesBloc>(
      () => _i10.SitesBloc(get<_i8.InRepository>(), get<_i5.LocalRepository>()),
      registerFor: {_prod});
  return get;
}

class _$RegisterModule extends _i11.RegisterModule {}
