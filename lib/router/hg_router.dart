import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'
    show GoRouter, ShellRoute, GoRouterState, GoRoute;
import 'package:happy_grocers/datamodels/user.dart';
import 'package:happy_grocers/presentation/pages/home_screen.dart';
import 'package:happy_grocers/router/navigation_observer.dart';
import 'package:happy_grocers/router/hg_auth_router.dart';
import 'package:happy_grocers/router/hg_route.dart';
import 'package:happy_grocers/router/hg_transition_page.dart';
import 'package:happy_grocers/utils/local_storage/storage_manager.dart';

class HGRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final shellNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter getRouter() {
    final router = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: HGRoute.splashRoutePath,

      routes: [
        HGAuthRouter.getSplashRoute(),
        HGAuthRouter.getWelcomeRoute(),
        HGAuthRouter.getLoginrRoute(),
        HGAuthRouter.getSignUpRoute(),
        // HGAuthRouter.getForgotPasswordRoute(),
        ShellRoute(
          observers: [NavigationObserver()],
          navigatorKey: shellNavigatorKey,
          builder: (context, state, child) {
            return child;
          },
          routes: [
            getHomeRoute(),
            // getEventDetailRoute(),
            // getTicketListtingRoute(),
            // getAttendeeDetailRoute(),
            // getPaymentOptionRoute(),
            // getCreditDebitDetailsRoute(),
            // getThankYouMessageRoute()
          ],
        ),
      ],
      redirect: (context, state) {
        User? userData = StorageManager.getInstance().getLoginUser();
        if (userData == null &&
            (state.location != HGRoute.forgotPasswordRoutePath &&
                state.location != HGRoute.welcomeRoutePath &&
                state.location != HGRoute.loginRoutePath &&
                state.location != HGRoute.registerRoutePath &&
                state.location != HGRoute.signUpRoutePath &&

                state.location != HGRoute.newPasswordRoutePath)) {
          return state.namedLocation(HGRoute.splashRoute);
        } else if (userData != null &&
            (state.location == HGRoute.splashRoutePath ||
                state.location == HGRoute.forgotPasswordRoutePath ||
                state.location == HGRoute.welcomeRoutePath ||
                state.location == HGRoute.loginRoutePath ||
                state.location == HGRoute.signUpRoutePath||
                state.location == HGRoute.registerRoutePath ||
                state.location == HGRoute.newPasswordRoutePath)) {
          return state.namedLocation(HGRoute.homeRoute);
        } else {
          return null;
        }
      },
      debugLogDiagnostics: kDebugMode,
    );
    return router;
  }

  static GoRoute getHomeRoute() {
    return GoRoute(
      parentNavigatorKey: shellNavigatorKey,
      name: HGRoute.homeRoute,
      path: HGRoute.homeRoutePath,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return HGTransitionPage(
          state: state,
          key: state.pageKey,
          restorationId: state.pageKey.value,
          name: state.fullPath,
          child: const HomeScreen(),
        );
      },
    );
  }

  // static GoRoute getEventDetailRoute() {
  //   return GoRoute(
  //     parentNavigatorKey: shellNavigatorKey,
  //     name: WDMRoute.eventDetailRoute,
  //     path: WDMRoute.eventDetailRoutePath,
  //     pageBuilder: (BuildContext context, GoRouterState state) {
  //       return HGTransitionPage(
  //         state: state,
  //         key: state.pageKey,
  //         restorationId: state.pageKey.value,
  //         name: state.fullPath,
  //         child: EventsDetailScreen(
  //           eventId: state.queryParameters['eventId'] ?? '',
  //         ),
  //       );
  //     },
  //   );
  // }

  // static GoRoute getTicketListtingRoute() {
  //   return GoRoute(
  //     parentNavigatorKey: shellNavigatorKey,
  //     name: WDMRoute.ticketListingRoute,
  //     path: WDMRoute.ticketListingRoutePath,
  //     pageBuilder: (BuildContext context, GoRouterState state) {
  //       return HGTransitionPage(
  //         state: state,
  //         key: state.pageKey,
  //         restorationId: state.pageKey.value,
  //         name: state.fullPath,
  //         child: const EventTicketListing(),
  //       );
  //     },
  //   );
  // }

  // static GoRoute getAttendeeDetailRoute() {
  //   return GoRoute(
  //     parentNavigatorKey: shellNavigatorKey,
  //     name: WDMRoute.attendeDetailRoute,
  //     path: WDMRoute.attendeDetailRoutePath,
  //     pageBuilder: (BuildContext context, GoRouterState state) {
  //       return HGTransitionPage(
  //         state: state,
  //         key: state.pageKey,
  //         restorationId: state.pageKey.value,
  //         name: state.fullPath,
  //         child: const AttendeDetailsScreen(),
  //       );
  //     },
  //   );
  // }

  // static GoRoute getPaymentOptionRoute() {
  //   return GoRoute(
  //     parentNavigatorKey: shellNavigatorKey,
  //     name: WDMRoute.paymentOptionRoute,
  //     path: WDMRoute.paymentOptionRoutePath,
  //     pageBuilder: (BuildContext context, GoRouterState state) {
  //       return HGTransitionPage(
  //         state: state,
  //         key: state.pageKey,
  //         restorationId: state.pageKey.value,
  //         name: state.fullPath,
  //         child: const PaymentOptionScreen(),
  //       );
  //     },
  //   );
  // }

  // static GoRoute getCreditDebitDetailsRoute() {
  //   return GoRoute(
  //     parentNavigatorKey: shellNavigatorKey,
  //     name: WDMRoute.creditDebitDetailsRoute,
  //     path: WDMRoute.creditDebitDetailsRoutePath,
  //     pageBuilder: (BuildContext context, GoRouterState state) {
  //       return HGTransitionPage(
  //         state: state,
  //         key: state.pageKey,
  //         restorationId: state.pageKey.value,
  //         name: state.fullPath,
  //         child: const CreditDebitDetailScreen(),
  //       );
  //     },
  //   );
  // }

  // static GoRoute getThankYouMessageRoute() {
  //   return GoRoute(
  //     parentNavigatorKey: shellNavigatorKey,
  //     name: WDMRoute.thankYouMessageRoute,
  //     path: WDMRoute.thankYouMessageRoutePath,
  //     pageBuilder: (BuildContext context, GoRouterState state) {
  //       return HGTransitionPage(
  //         state: state,
  //         key: state.pageKey,
  //         restorationId: state.pageKey.value,
  //         name: state.fullPath,
  //         child: const ThankYouMessageScreen(),
  //       );
  //     },
  //   );
  // }
}
