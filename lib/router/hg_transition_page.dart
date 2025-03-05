import 'dart:convert';
import 'package:go_router/go_router.dart';
import 'package:happy_grocers/router/hg_route_stack.dart';
import 'package:happy_grocers/utils/local_storage/storage_manager.dart';

List<String> routeStack = [];
final routeStackModel = RouteStack();

class HGTransitionPage<T> extends NoTransitionPage<T> {
  final GoRouterState state;
  HGTransitionPage({
    required super.child,
    required this.state,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) {
    String name = state.fullPath!.replaceFirst(RegExp('/'), '');

    List<String> path = getRouteName(name);
    routeStack = [];
    routeStack.addAll(path);
    routeStackModel.route = routeStack;
    StorageManager.getInstance().setString(
      path[path.length - 1],
      json.encode(state.queryParameters),
    );
  }

  List<String> getRouteName(String name) {
    return name.split("/");
  }
}
