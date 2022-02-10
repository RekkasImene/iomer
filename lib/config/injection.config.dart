// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:drift/drift.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/categorie/categorie_bloc.dart' as _i12;
import '../bloc/matricule/matricule_bloc.dart' as _i14;
import '../bloc/ot/ot_bloc.dart' as _i8;
import '../bloc/parts/parts_bloc.dart' as _i10;
import '../bloc/report/report_bloc.dart' as _i11;
import '../bloc/site/sites_bloc.dart' as _i15;
import '../bloc/taches/taches_bloc.dart' as _i16;
import '../models/bdd/iomer_database.dart' as _i6;
import '../models/repository/in_repository.dart' as _i13;
import '../models/repository/local_repository.dart' as _i7;
import '../models/repository/out_repository.dart' as _i9;
import '../models/repository/registermodule.dart' as _i17;
import '../webService/services.dart' as _i5;

const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.Client>(registerModule.client);
  gh.singleton<_i4.QueryExecutor>(registerModule.queryExecutor);
  gh.singleton<_i5.Services>(_i5.Services(get<_i3.Client>()),
      registerFor: {_prod});
  gh.singleton<_i6.IomerDatabase>(_i6.IomerDatabase(get<_i4.QueryExecutor>()),
      registerFor: {_prod});
  gh.singleton<_i7.LocalRepository>(
      _i7.LocalRepository(get<_i6.IomerDatabase>()),
      registerFor: {_prod});
  gh.factory<_i8.OtBloc>(() => _i8.OtBloc(get<_i7.LocalRepository>()),
      registerFor: {_prod});
  gh.singleton<_i9.OutRepository>(_i9.OutRepository(get<_i6.IomerDatabase>()),
      registerFor: {_prod});
  gh.factory<_i10.PartsBloc>(() => _i10.PartsBloc(get<_i7.LocalRepository>()),
      registerFor: {_prod});
  gh.factory<_i11.ReportBloc>(() => _i11.ReportBloc(get<_i7.LocalRepository>()),
      registerFor: {_prod});
  gh.factory<_i12.CategorieBloc>(
      () => _i12.CategorieBloc(get<_i7.LocalRepository>()),
      registerFor: {_prod});
  gh.singleton<_i13.InRepository>(
      _i13.InRepository(get<_i6.IomerDatabase>(), get<_i7.LocalRepository>(),
          get<_i5.Services>()),
      registerFor: {_prod});
  gh.factory<_i14.MatriculeBloc>(
      () => _i14.MatriculeBloc(
          get<_i7.LocalRepository>(), get<_i13.InRepository>()),
      registerFor: {_prod});
  gh.factory<_i15.SitesBloc>(
      () =>
          _i15.SitesBloc(get<_i13.InRepository>(), get<_i7.LocalRepository>()),
      registerFor: {_prod});
  gh.factory<_i16.TachesBloc>(
      () =>
          _i16.TachesBloc(get<_i7.LocalRepository>(), get<_i13.InRepository>()),
      registerFor: {_prod});
  return get;
}

class _$RegisterModule extends _i17.RegisterModule {}
