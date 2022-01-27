// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/matricule/matricule_bloc.dart' as _i5;
import '../bloc/site/sites_bloc.dart' as _i8;
import '../models/bdd/iomer_database.dart' as _i3;
import '../models/repository/in_repository.dart' as _i7;
import '../models/repository/local_repository.dart' as _i4;
import '../models/repository/out_repository.dart' as _i6;

const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.IomerDatabase>(() => _i3.IomerDatabase(),
      registerFor: {_prod});
  gh.singleton<_i4.LocalRepository>(
      _i4.LocalRepository(get<_i3.IomerDatabase>()),
      registerFor: {_prod});
  gh.factory<_i5.MatriculeBloc>(
      () => _i5.MatriculeBloc(get<_i4.LocalRepository>()),
      registerFor: {_prod});
  gh.factory<_i6.OutRepository>(
      () => _i6.OutRepository(get<_i3.IomerDatabase>()),
      registerFor: {_prod});
  gh.singleton<_i7.InRepository>(_i7.InRepository(get<_i3.IomerDatabase>()),
      registerFor: {_prod});
  gh.factory<_i8.SitesBloc>(
      () => _i8.SitesBloc(get<_i7.InRepository>(), get<_i4.LocalRepository>()),
      registerFor: {_prod});
  return get;
}
