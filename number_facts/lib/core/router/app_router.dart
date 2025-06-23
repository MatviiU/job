import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:number_facts/core/data/models/number_fact.dart';
import 'package:number_facts/features/fact/presentation/screen/fact.dart';
import 'package:number_facts/features/history/presentation/screen/history.dart';
import 'package:number_facts/features/menu/presentation/screen/menu.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter{

  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: MenuRoute.page, initial: true),
    AutoRoute(path: '/fact', page: FactRoute.page),
    AutoRoute(path: '/history', page: HistoryRoute.page),
  ];
}