import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_grocers/auth_module/presentation/pages/login_screen.dart';
import 'package:happy_grocers/auth_module/presentation/pages/sign_up_screen.dart';
import 'package:happy_grocers/auth_module/presentation/pages/welcome_screen.dart';
import 'package:happy_grocers/auth_module/presentation/pages/splash_screen.dart';
import 'package:happy_grocers/router/hg_route.dart';
import 'package:happy_grocers/router/hg_router.dart';
import 'package:happy_grocers/router/hg_transition_page.dart';

class HGAuthRouter {
  static GoRoute getSplashRoute() {
    return GoRoute(
      parentNavigatorKey: HGRouter.rootNavigatorKey,
      name: HGRoute.splashRoute,
      path: HGRoute.splashRoutePath,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return HGTransitionPage(
          state: state,
          name: state.fullPath,
          child: const ScreenScreen(),
        );
      },
    );
  }

  static GoRoute getWelcomeRoute() {
    return GoRoute(
      parentNavigatorKey: HGRouter.rootNavigatorKey,
      name: HGRoute.welcomeRoute,
      path: HGRoute.welcomeRoutePath,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return HGTransitionPage(
          state: state,
          name: state.fullPath,
          child: const WelcomeScreen(),
        );
      },
    );
  }

  static GoRoute getLoginrRoute() {
    return GoRoute(
      parentNavigatorKey: HGRouter.rootNavigatorKey,
      name: HGRoute.loginRoute,
      path: HGRoute.loginRoutePath,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return HGTransitionPage(
          state: state,
          name: state.fullPath,
          child: const LoginScreen(),
        );
      },
    );
  }

   static GoRoute getSignUpRoute() {
    return GoRoute(
      parentNavigatorKey: HGRouter.rootNavigatorKey,
      name: HGRoute.signUpRoute,
      path: HGRoute.signUpRoutePath,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return HGTransitionPage(
          state: state,
          name: state.fullPath,
          child: const SignupScreen(),
        );
      },
    );
  }

  // static GoRoute getForgotPasswordRoute() {
  //   return GoRoute(
  //     parentNavigatorKey: WDMRouter.rootNavigatorKey,
  //     name: WDMRoute.forgotPasswordRoute,
  //     path: WDMRoute.forgotPasswordRoutePath,
  //     pageBuilder: (BuildContext context, GoRouterState state) {
  //       return HGTransitionPage(
  //         state: state,
  //         name: state.fullPath,
  //         child: const ForgotPasswordScreen(),
  //       );
  //     },
  //   );
  // }
}
