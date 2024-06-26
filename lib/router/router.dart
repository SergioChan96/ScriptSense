import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:scriptsense/ui/history_page.dart';
import 'package:scriptsense/ui/translation_page.dart';
import 'package:scriptsense/ui/home_page.dart';
import 'package:scriptsense/ui/settings_page.dart';
import 'package:scriptsense/ui/evaluate_page.dart';
import 'package:scriptsense/ui/settings/more_settings.dart';


final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => MaterialPage<void>(
          child: HomePage(),
        ),
        routes: [
          GoRoute(
            path: 'evaluate',
            pageBuilder: (context, state) => const MaterialPage<void>(
              child: Evaluate(),
            ),
          ),
        ]
      ),
      GoRoute(
        path: '/history',
        pageBuilder: (context, state) => const MaterialPage<void>(
          child: History(),
        ),
      ),
      GoRoute(
        path: '/translation',
        pageBuilder: (context, state) => const MaterialPage<void>(
          child: Translation(),
        ),
      ),
      GoRoute(
        path: '/settings',
        pageBuilder: (context, state) => const MaterialPage<void>(
          child: Settings(),
        ),
        routes: [
          GoRoute(
            path: 'more_settings',
            pageBuilder: (context, state) => const MaterialPage<void>(
              child: MoreSettings(),
            ),
          ),
          GoRoute(
            path: 'impressum',
            pageBuilder: (context, state) => const MaterialPage<void>(
              child: MoreSettings(),
            ),
          ),
          GoRoute(
            path: 'terms_and_conditions',
            pageBuilder: (context, state) => const MaterialPage<void>(
              child: MoreSettings(),
            ),
          ),
          GoRoute(
            path: 'tipps_and_tricks.dart',
            pageBuilder: (context, state) => const MaterialPage<void>(
              child: MoreSettings(),
            ),
          ),
        ]
      ),
    ],
  );
