import 'package:flutter/material.dart';
import 'package:poker_stats_app/router/router.dart';

class PokerStatsApp extends StatelessWidget {
  PokerStatsApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'SF Pro Display'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
