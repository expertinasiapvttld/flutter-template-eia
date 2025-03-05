import 'package:flutter/material.dart';
import 'package:happy_grocers/router/hg_route_stack.dart';
import 'package:happy_grocers/utils/logger/logger.dart';

List<String> routeStack = [];
final routeStackModel = RouteStack();

class NavigationObserver extends NavigatorObserver {
  List<String>? getRouteNames(Route<dynamic> route) {
    String? name = route.settings.name?.replaceFirst(RegExp(r'/'), '');
    return name?.split("/");
  }

  List<String> getRouteName(String name) {
    return name.split("/");
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null && route.settings.name?.isEmpty == false) {
      if (route.settings.name?.contains(RegExp('/')) == true) {
        String? name = route.settings.name?.replaceFirst(RegExp('/'), '');
        if (name != null) {
          routeStack = [];
          routeStack.addAll(getRouteName(name));
          routeStackModel.route = routeStack;
        }
      }
    } else if (previousRoute?.settings.name != null) {
      String? name =
          previousRoute?.settings.name?.replaceFirst(RegExp('/'), '');
      if (name != null) {
        routeStack = [];
        routeStack.addAll(getRouteName(name));
        routeStackModel.route = routeStack;
      }
    }
    log.d(
        "didPush Current Route: ${route.settings.name} Previous Route: ${previousRoute?.settings.name}");
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute?.settings.name != null) {
      String? name =
          previousRoute?.settings.name?.replaceFirst(RegExp(r'/'), '');
      if (name != null) {
        routeStack = [];
        routeStack.addAll(getRouteName(name));
        routeStackModel.route = routeStack;
      }
    }
    log.d(
        "didPop Current Route: ${route.settings.name} Previous Route: ${previousRoute?.settings.name}");
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute?.settings.name != null) {
      String? name =
          previousRoute?.settings.name?.replaceFirst(RegExp(r'/'), '');
      if (name != null) {
        routeStack = [];
        routeStack.addAll(getRouteName(name));
        routeStackModel.route = routeStack;
      }
    }
    log.d(
        "didRemove urrent Route: ${route.settings.name} Previous Route: ${previousRoute?.settings.name}");
  }

  @override
  void didReplace({Route<dynamic>? oldRoute, Route<dynamic>? newRoute}) {
    log.d(
        "didReplace Old Route: ${oldRoute?.settings.name} New Route: ${newRoute?.settings.name}");
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    log.d(
        "didStartUserGesture Current Route: ${route.settings.name} Previous Route: ${previousRoute?.settings.name}");
  }
}
