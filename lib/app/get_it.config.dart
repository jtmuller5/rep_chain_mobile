// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../features/credentials/services/credential_service.dart' as _i3;
import '../features/monitoring/services/amplitude_analytics_service.dart'
    as _i5;
import '../features/monitoring/services/crash_service.dart' as _i7;
import '../features/monitoring/services/fast_analytics_service.dart' as _i4;
import '../features/monitoring/services/fast_crash_service.dart' as _i6;
import '../features/settings/services/settings_service.dart' as _i9;
import '../features/shared/services/modules.dart' as _i10;

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
  gh.singleton<_i4.FastAnalyticsService>(_i5.AmplitudeAnalyticsService());
  gh.singleton<_i6.FastCrashService>(_i7.CrashService());
  await gh.factoryAsync<_i8.SharedPreferences>(
    () => registerModule.sharedPrefs,
    preResolve: true,
  );
  gh.singleton<_i9.SettingsService>(_i9.SettingsService());
  return getIt;
}

class _$RegisterModule extends _i10.RegisterModule {}
