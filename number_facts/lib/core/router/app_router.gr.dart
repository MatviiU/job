// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [FactScreen]
class FactRoute extends PageRouteInfo<FactRouteArgs> {
  FactRoute({Key? key, required NumberFact fact, List<PageRouteInfo>? children})
    : super(
        FactRoute.name,
        args: FactRouteArgs(key: key, fact: fact),
        initialChildren: children,
      );

  static const String name = 'FactRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FactRouteArgs>();
      return FactScreen(key: args.key, fact: args.fact);
    },
  );
}

class FactRouteArgs {
  const FactRouteArgs({this.key, required this.fact});

  final Key? key;

  final NumberFact fact;

  @override
  String toString() {
    return 'FactRouteArgs{key: $key, fact: $fact}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FactRouteArgs) return false;
    return key == other.key && fact == other.fact;
  }

  @override
  int get hashCode => key.hashCode ^ fact.hashCode;
}

/// generated route for
/// [HistoryScreen]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute({List<PageRouteInfo>? children})
    : super(HistoryRoute.name, initialChildren: children);

  static const String name = 'HistoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HistoryScreen();
    },
  );
}

/// generated route for
/// [MenuScreen]
class MenuRoute extends PageRouteInfo<MenuRouteArgs> {
  MenuRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        MenuRoute.name,
        args: MenuRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'MenuRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MenuRouteArgs>(
        orElse: () => const MenuRouteArgs(),
      );
      return MenuScreen(key: args.key);
    },
  );
}

class MenuRouteArgs {
  const MenuRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MenuRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MenuRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}
