import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:rep_chain_mobile/features/credentials/ui/authenticate/authenticate_view.dart';
import 'package:rep_chain_mobile/features/credentials/ui/credentials/credentials_view.dart';
import 'package:rep_chain_mobile/features/credentials/ui/existing_wallet/existing_wallet_view.dart';
import 'package:rep_chain_mobile/features/credentials/ui/new_wallet/new_wallet_view.dart';
import 'package:rep_chain_mobile/features/credentials/ui/verify_wallet/verify_wallet_view.dart';
import 'package:rep_chain_mobile/features/home/ui/credential_list/credential_list_view.dart';
import 'package:rep_chain_mobile/features/home/ui/home/home_view.dart';

import 'package:rep_chain_mobile/features/home/ui/onboarding/onboarding_view.dart';
import 'package:rep_chain_mobile/features/settings/ui/settings/settings_view.dart';
import 'package:rep_chain_mobile/modules/notes/ui/notes/notes_view.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: ('View,Route'))
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthenticateRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: ExistingWalletRoute.page),
        AutoRoute(page: NewWalletRoute.page),
        AutoRoute(page: VerifyWalletRoute.page),
        AutoRoute(page: CredentialListRoute.page),
        AutoRoute(page: CredentialsRoute.page),
      ];
}
