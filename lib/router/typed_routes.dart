import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scriptsense/ui/pages/camera_page.dart';

import 'package:scriptsense/ui/pages/sub_settings/terms_and_condition.dart';
import 'package:scriptsense/ui/pages/sub_settings/tipps_and_tricks.dart';
import 'package:scriptsense/ui/pages/history_page.dart';
import 'package:scriptsense/ui/pages/translation_page.dart';
import 'package:scriptsense/ui/pages/home_page.dart';
import 'package:scriptsense/ui/pages/settings_page.dart';
import 'package:scriptsense/ui/pages/result_page.dart';
import 'package:scriptsense/ui/pages/sub_settings/more_settings.dart';

import '../ui/pages/sub_settings/impressum.dart';

part 'typed_routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<CameraRoute>(
      path: 'camera',
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
class CameraRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CameraPage();
  }
}

@TypedGoRoute<ResultRoute>(
  path: "/result",
)
@immutable
class ResultRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ResultPage(state.extra as Uint8List);
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
