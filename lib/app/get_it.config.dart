// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../features/credentials/services/credential_service.dart' as _i3;
import '../features/dids/services/did_service.dart' as _i4;
import '../features/monitoring/services/amplitude_analytics_service.dart'
    as _i6;
import '../features/monitoring/services/crash_service.dart' as _i8;
import '../features/monitoring/services/fast_analytics_service.dart' as _i5;
import '../features/monitoring/services/fast_crash_service.dart' as _i7;
import '../features/settings/services/settings_service.dart' as _i10;
import '../features/shared/services/modules.dart' as _i11;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.CredentialService>(() => _i3.CredentialService());
  gh.factory<_i4.DidService>(() => _i4.DidService());
  gh.singleton<_i5.FastAnalyticsService>(_i6.AmplitudeAnalyticsService());
  gh.singleton<_i7.FastCrashService>(_i8.CrashService());
  await gh.factoryAsync<_i9.SharedPreferences>(
    () => registerModule.sharedPrefs,
    preResolve: true,
  );
  gh.singleton<_i10.SettingsService>(_i10.SettingsService());
  return getIt;
}

class _$RegisterModule extends _i11.RegisterModule {}
