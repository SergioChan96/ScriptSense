import 'package:chinese_ocr/ui/pages/sub_settings/terms_and_condition.dart';
import 'package:chinese_ocr/ui/pages/sub_settings/tipps_and_tricks.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:chinese_ocr/ui/pages/history_page.dart';
import 'package:chinese_ocr/ui/pages/translation_page.dart';
import 'package:chinese_ocr/ui/pages/home_page.dart';
import 'package:chinese_ocr/ui/pages/settings_page.dart';
import 'package:chinese_ocr/ui/pages/evaluate_page.dart';
import 'package:chinese_ocr/ui/pages/sub_settings/more_settings.dart';

import '../ui/pages/sub_settings/impressum.dart';

part 'typed_routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<EvaluateRoute>(
      path: 'evaluate',
    ),
  ],
)
@immutable
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomePage();
  }
}

@immutable
class EvaluateRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Evaluate();
  }
}

@TypedGoRoute<HistoryRoute>(
  path: '/history',
)
@immutable
class HistoryRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return History();
  }
}

@TypedGoRoute<TranslationRoute>(
  path: '/translation',
)
@immutable
class TranslationRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Translation();
  }
}

@TypedGoRoute<SettingsRoute>(
  path: '/settings',
  routes: [
    TypedGoRoute<MoreSettingsRoute>(
      path: 'more_settings',
    ),
    TypedGoRoute<ImpressumRoute>(
      path: 'impressum',
    ),
    TypedGoRoute<TermsAndConditionsRoute>(
      path: 'terms_and_conditions',
    ),
    TypedGoRoute<TippsAndTricksRoute>(
      path: 'tipps_and_tricks',
    ),
  ],
)
@immutable
class SettingsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Settings();
  }
}

@immutable
class MoreSettingsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MoreSettings();
  }
}

@immutable
class ImpressumRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Impressum();
  }
}

@immutable
class TermsAndConditionsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TermsAndConditions();
  }
}

@immutable
class TippsAndTricksRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TippsAndTricks();
  }
}
