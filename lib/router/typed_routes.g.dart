// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typed_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $historyRoute,
      $translationRoute,
      $settingsRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'result',
          factory: $ResultRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ResultRouteExtension on ResultRoute {
  static ResultRoute _fromState(GoRouterState state) => ResultRoute();

  String get location => GoRouteData.$location(
        '/result',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $historyRoute => GoRouteData.$route(
      path: '/history',
      factory: $HistoryRouteExtension._fromState,
    );

extension $HistoryRouteExtension on HistoryRoute {
  static HistoryRoute _fromState(GoRouterState state) => HistoryRoute();

  String get location => GoRouteData.$location(
        '/history',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $translationRoute => GoRouteData.$route(
      path: '/translation',
      factory: $TranslationRouteExtension._fromState,
    );

extension $TranslationRouteExtension on TranslationRoute {
  static TranslationRoute _fromState(GoRouterState state) => TranslationRoute();

  String get location => GoRouteData.$location(
        '/translation',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $settingsRoute => GoRouteData.$route(
      path: '/settings',
      factory: $SettingsRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'more_settings',
          factory: $MoreSettingsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'impressum',
          factory: $ImpressumRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'terms_and_conditions',
          factory: $TermsAndConditionsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'tipps_and_tricks',
          factory: $TippsAndTricksRouteExtension._fromState,
        ),
      ],
    );

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MoreSettingsRouteExtension on MoreSettingsRoute {
  static MoreSettingsRoute _fromState(GoRouterState state) =>
      MoreSettingsRoute();

  String get location => GoRouteData.$location(
        '/settings/more_settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ImpressumRouteExtension on ImpressumRoute {
  static ImpressumRoute _fromState(GoRouterState state) => ImpressumRoute();

  String get location => GoRouteData.$location(
        '/settings/impressum',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TermsAndConditionsRouteExtension on TermsAndConditionsRoute {
  static TermsAndConditionsRoute _fromState(GoRouterState state) =>
      TermsAndConditionsRoute();

  String get location => GoRouteData.$location(
        '/settings/terms_and_conditions',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TippsAndTricksRouteExtension on TippsAndTricksRoute {
  static TippsAndTricksRoute _fromState(GoRouterState state) =>
      TippsAndTricksRoute();

  String get location => GoRouteData.$location(
        '/settings/tipps_and_tricks',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
