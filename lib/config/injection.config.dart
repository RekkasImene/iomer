// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../models/bdd/iomer_database.dart' as _i4;
import '../models/repository/in_repository.dart' as _i3;
import '../models/repository/local_repository.dart' as _i5;
import '../models/repository/out_repository.dart' as _i6;

const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.InRepository>(_i3.InRepository(), registerFor: {_prod});
  gh.factory<_i4.IomerDatabase>(() => _i4.IomerDatabase(),
      registerFor: {_prod});
  gh.factory<_i5.LocalRepository>(
      () => _i5.LocalRepository(get<_i4.IomerDatabase>()),
      registerFor: {_prod});
  gh.factory<_i6.OutRepository>(
      () => _i6.OutRepository(get<_i4.IomerDatabase>()),
      registerFor: {_prod});
  return get;
}
