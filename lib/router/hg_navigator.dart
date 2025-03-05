import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HGNavigator {
  static void goNamed(
    BuildContext context,
    String routeName,
  ) {
    GoRouter.of(context).goNamed(routeName);
  }

  static void pushNamed(
    BuildContext context,
    String routeName, {
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
  }) {
    GoRouter.of(context).pushNamed(
      routeName,
      queryParameters: queryParameters,
    );
  }

  static void goBack(
    BuildContext context,
  ) {
    GoRouter.of(context).pop();
  }
}
