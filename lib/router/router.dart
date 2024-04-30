import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:poker_stats_app/screens/analysis/analysis_screen.dart';
import 'package:poker_stats_app/screens/onboarding/onboarding_screen.dart';
import 'package:poker_stats_app/screens/result/result_screen.dart';
import 'package:poker_stats_app/screens/settings/settings_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardingRoute.page, initial: true),
        AutoRoute(page: ResultRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: AnalysisRoute.page),

  ];
}
