// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:drift/drift.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/matricule/matricule_bloc.dart' as _i11;
import '../bloc/ot/ot_bloc.dart' as _i4;
import '../bloc/site/sites_bloc.dart' as _i12;
import '../models/bdd/iomer_database.dart' as _i8;
import '../models/repository/in_repository.dart' as _i10;
import '../models/repository/local_repository.dart' as _i5;
import '../models/repository/out_repository.dart' as _i9;
import '../models/repository/registermodule.dart' as _i13;
import '../webService/services.dart' as _i7;

const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.Client>(registerModule.client);
  gh.factory<_i4.OtBloc>(() => _i4.OtBloc(get<_i5.LocalRepository>()),
      registerFor: {_prod});
  gh.singleton<_i6.QueryExecutor>(registerModule.queryExecutor);
  gh.singleton<_i7.Services>(_i7.Services(get<_i3.Client>()),
      registerFor: {_prod});
  gh.singleton<_i8.IomerDatabase>(_i8.IomerDatabase(get<_i6.QueryExecutor>()),
      registerFor: {_prod});
  gh.singleton<_i9.OutRepository>(_i9.OutRepository(get<_i8.IomerDatabase>()),
      registerFor: {_prod});
  gh.singleton<_i10.InRepository>(
      _i10.InRepository(get<_i8.IomerDatabase>(), get<_i5.LocalRepository>(),
          get<_i7.Services>()),
      registerFor: {_prod});
  gh.factory<_i11.MatriculeBloc>(
      () => _i11.MatriculeBloc(
          get<_i5.LocalRepository>(), get<_i10.InRepository>()),
      registerFor: {_prod});
  gh.factory<_i12.SitesBloc>(
      () =>
          _i12.SitesBloc(get<_i10.InRepository>(), get<_i5.LocalRepository>()),
      registerFor: {_prod});
  return get;
}

class _$RegisterModule extends _i13.RegisterModule {}
