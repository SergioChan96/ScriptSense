import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:chinese_ocr/ui/history_page.dart';
import 'package:chinese_ocr/ui/translation_page.dart';
import 'package:chinese_ocr/ui/home_page.dart';
import 'package:chinese_ocr/ui/settings_page.dart';
import 'package:chinese_ocr/ui/evaluate_page.dart';
import 'package:chinese_ocr/ui/settings/more_settings.dart';


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
        /*routes: [
          GoRoute(
            path: 'more_settings',
            pageBuilder: (context, state) => const MaterialPage<void>(
              child: MoreSettings(),
            ),
          ),
        ]*/
      ),
    ],
  );
