import 'package:rep_chain_mobile/features/credentials/services/credential_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rep_chain_mobile/app/get_it.dart';
import 'package:rep_chain_mobile/app/router.dart';
import 'package:rep_chain_mobile/features/monitoring/services/fast_analytics_service.dart';
import 'package:rep_chain_mobile/features/monitoring/services/fast_crash_service.dart';
import 'package:rep_chain_mobile/features/settings/services/settings_service.dart';

AppRouter get router => getIt.get<AppRouter>();

CredentialService get credentialService => getIt.get<CredentialService>();

FastAnalyticsService get analyticsService => getIt.get<FastAnalyticsService>();

FastCrashService get crashService => getIt.get<FastCrashService>();

SettingsService get settingsService => getIt.get<SettingsService>();

SharedPreferences get sharedPrefs => getIt.get<SharedPreferences>();
