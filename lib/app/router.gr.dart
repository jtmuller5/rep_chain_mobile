// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthenticateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthenticateView(),
      );
    },
    CredentialListRoute.name: (routeData) {
      final args = routeData.argsAs<CredentialListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CredentialListView(
          key: args.key,
          provider: args.provider,
        ),
      );
    },
    ExistingWalletRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExistingWalletView(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    NewWalletRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewWalletView(),
      );
    },
    NotesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotesView(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingView(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsView(),
      );
    },
    VerifyWalletRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyWalletRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VerifyWalletView(
          key: args.key,
          challenge: args.challenge,
        ),
      );
    },
  };
}

/// generated route for
/// [AuthenticateView]
class AuthenticateRoute extends PageRouteInfo<void> {
  const AuthenticateRoute({List<PageRouteInfo>? children})
      : super(
          AuthenticateRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CredentialListView]
class CredentialListRoute extends PageRouteInfo<CredentialListRouteArgs> {
  CredentialListRoute({
    Key? key,
    required String provider,
    List<PageRouteInfo>? children,
  }) : super(
          CredentialListRoute.name,
          args: CredentialListRouteArgs(
            key: key,
            provider: provider,
          ),
          initialChildren: children,
        );

  static const String name = 'CredentialListRoute';

  static const PageInfo<CredentialListRouteArgs> page =
      PageInfo<CredentialListRouteArgs>(name);
}

class CredentialListRouteArgs {
  const CredentialListRouteArgs({
    this.key,
    required this.provider,
  });

  final Key? key;

  final String provider;

  @override
  String toString() {
    return 'CredentialListRouteArgs{key: $key, provider: $provider}';
  }
}

/// generated route for
/// [ExistingWalletView]
class ExistingWalletRoute extends PageRouteInfo<void> {
  const ExistingWalletRoute({List<PageRouteInfo>? children})
      : super(
          ExistingWalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExistingWalletRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewWalletView]
class NewWalletRoute extends PageRouteInfo<void> {
  const NewWalletRoute({List<PageRouteInfo>? children})
      : super(
          NewWalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewWalletRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotesView]
class NotesRoute extends PageRouteInfo<void> {
  const NotesRoute({List<PageRouteInfo>? children})
      : super(
          NotesRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingView]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyWalletView]
class VerifyWalletRoute extends PageRouteInfo<VerifyWalletRouteArgs> {
  VerifyWalletRoute({
    Key? key,
    required String challenge,
    List<PageRouteInfo>? children,
  }) : super(
          VerifyWalletRoute.name,
          args: VerifyWalletRouteArgs(
            key: key,
            challenge: challenge,
          ),
          initialChildren: children,
        );

  static const String name = 'VerifyWalletRoute';

  static const PageInfo<VerifyWalletRouteArgs> page =
      PageInfo<VerifyWalletRouteArgs>(name);
}

class VerifyWalletRouteArgs {
  const VerifyWalletRouteArgs({
    this.key,
    required this.challenge,
  });

  final Key? key;

  final String challenge;

  @override
  String toString() {
    return 'VerifyWalletRouteArgs{key: $key, challenge: $challenge}';
  }
}
