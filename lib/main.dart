import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:rep_chain_mobile/app/get_it.dart';
import 'package:rep_chain_mobile/app/router.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:rep_chain_mobile/app/theme.dart';
import 'package:rep_chain_mobile/features/shared/utils/navigation/basic_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await analyticsService.initialize();
  GetIt.instance.registerSingleton(AppRouter());

  lightLogoColorScheme = await ColorScheme.fromImageProvider(
      provider: const AssetImage('assets/images/logo.png'),
      brightness: Brightness.light);
  darkLogoColorScheme = await ColorScheme.fromImageProvider(
      provider: const AssetImage('assets/images/logo.png'),
      brightness: Brightness.dark);

  await SentryFlutter.init(
    (options) {
      options.dsn = const String.fromEnvironment('SENTRY_DSN');
    },
    appRunner: () => runApp(const MainApp()),
  );

  // runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: settingsService.themeMode,
        builder: (context, mode, child) {
          return MaterialApp.router(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: mode,
            routerConfig: router.config(
              navigatorObservers: () => [
                SentryNavigatorObserver(),
                BasicObserver(),
              ],
            ),
          );
        });
  }
}
