import 'package:auto_route/auto_route.dart';
import 'package:rep_chain_mobile/features/home/ui/home/home_view.dart';

import 'package:rep_chain_mobile/features/home/ui/onboarding/onboarding_view.dart';
import 'package:rep_chain_mobile/features/settings/ui/settings/settings_view.dart';
import 'package:rep_chain_mobile/modules/notes/ui/notes/notes_view.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: ('View,Route'))
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ];
}
