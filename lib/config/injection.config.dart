// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/categorie/categorie_bloc.dart' as _i11;
import '../bloc/matricule/matricule_bloc.dart' as _i6;
import '../bloc/ot/ot_bloc.dart' as _i7;
import '../bloc/parts/parts_bloc.dart' as _i14;
import '../bloc/report/report_bloc.dart' as _i8;
import '../bloc/site/sites_bloc.dart' as _i15;
import '../bloc/taches/taches_bloc.dart' as _i10;
import '../models/bdd/iomer_database.dart' as _i4;
import '../models/repository/in_repository.dart' as _i12;
import '../models/repository/local_repository.dart' as _i5;
import '../models/repository/out_repository.dart' as _i13;
import '../models/repository/registermodule.dart' as _i16;
import '../webService/services.dart' as _i9;

const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.Client>(registerModule.client);
  gh.singleton<_i4.IomerDatabase>(registerModule.iomerDatabase);
  gh.singleton<_i5.LocalRepository>(
      _i5.LocalRepository(get<_i4.IomerDatabase>()),
      registerFor: {_prod});
  gh.factory<_i6.MatriculeBloc>(
      () => _i6.MatriculeBloc(get<_i5.LocalRepository>()),
      registerFor: {_prod});
  gh.factory<_i7.OtBloc>(() => _i7.OtBloc(get<_i5.LocalRepository>()),
      registerFor: {_prod});
  gh.factory<_i8.ReportBloc>(() => _i8.ReportBloc(get<_i5.LocalRepository>()),
      registerFor: {_prod});
  gh.singleton<_i9.Services>(_i9.Services(get<_i3.Client>()),
      registerFor: {_prod});
  gh.factory<_i10.TachesBloc>(() => _i10.TachesBloc(get<_i5.LocalRepository>()),
      registerFor: {_prod});
  gh.factory<_i11.CategorieBloc>(
      () => _i11.CategorieBloc(get<_i5.LocalRepository>()),
      registerFor: {_prod});
  gh.singleton<_i12.InRepository>(
      _i12.InRepository(get<_i4.IomerDatabase>(), get<_i5.LocalRepository>(),
          get<_i9.Services>()),
      registerFor: {_prod});
  gh.singleton<_i13.OutRepository>(
      _i13.OutRepository(get<_i4.IomerDatabase>(), get<_i9.Services>(),
          get<_i5.LocalRepository>(), get<_i12.InRepository>()),
      registerFor: {_prod});
  gh.factory<_i14.PartsBloc>(
      () =>
          _i14.PartsBloc(get<_i5.LocalRepository>(), get<_i12.InRepository>()),
      registerFor: {_prod});
  gh.factory<_i15.SitesBloc>(() => _i15.SitesBloc(get<_i12.InRepository>()),
      registerFor: {_prod});
  return get;
}

class _$RegisterModule extends _i16.RegisterModule {}
