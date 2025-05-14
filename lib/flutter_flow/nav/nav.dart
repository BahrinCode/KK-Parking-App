import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomeWidget() : AuthUserWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeWidget() : AuthUserWidget(),
        ),
        FFRoute(
          name: AuthUserWidget.routeName,
          path: AuthUserWidget.routePath,
          builder: (context, params) => AuthUserWidget(),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          requireAuth: true,
          builder: (context, params) => HomeWidget(
            location: params.getParam<ParkingLocationRow>(
              'location',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: NotificationWidget.routeName,
          path: NotificationWidget.routePath,
          requireAuth: true,
          builder: (context, params) => NotificationWidget(),
        ),
        FFRoute(
          name: ForgotPassWidget.routeName,
          path: ForgotPassWidget.routePath,
          builder: (context, params) => ForgotPassWidget(),
        ),
        FFRoute(
          name: AddParkWidget.routeName,
          path: AddParkWidget.routePath,
          builder: (context, params) => AddParkWidget(),
        ),
        FFRoute(
          name: HistoryWidget.routeName,
          path: HistoryWidget.routePath,
          builder: (context, params) => HistoryWidget(),
        ),
        FFRoute(
          name: LocationWidget.routeName,
          path: LocationWidget.routePath,
          requireAuth: true,
          builder: (context, params) => LocationWidget(
            location: params.getParam<ParkingLocationRow>(
              'location',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: MycarWidget.routeName,
          path: MycarWidget.routePath,
          builder: (context, params) => MycarWidget(),
        ),
        FFRoute(
          name: AddcarWidget.routeName,
          path: AddcarWidget.routePath,
          builder: (context, params) => AddcarWidget(),
        ),
        FFRoute(
          name: UserInfoWidget.routeName,
          path: UserInfoWidget.routePath,
          builder: (context, params) => UserInfoWidget(),
        ),
        FFRoute(
          name: ParkingScreenWidget.routeName,
          path: ParkingScreenWidget.routePath,
          builder: (context, params) => ParkingScreenWidget(),
        ),
        FFRoute(
          name: CompoundWidget.routeName,
          path: CompoundWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CompoundWidget(),
        ),
        FFRoute(
          name: TopupWalletWidget.routeName,
          path: TopupWalletWidget.routePath,
          builder: (context, params) => TopupWalletWidget(),
        ),
        FFRoute(
          name: SettingWidget.routeName,
          path: SettingWidget.routePath,
          builder: (context, params) => SettingWidget(),
        ),
        FFRoute(
          name: EditprofileWidget.routeName,
          path: EditprofileWidget.routePath,
          builder: (context, params) => EditprofileWidget(),
        ),
        FFRoute(
          name: ProfileviewWidget.routeName,
          path: ProfileviewWidget.routePath,
          builder: (context, params) => ProfileviewWidget(),
        ),
        FFRoute(
          name: SupportWidget.routeName,
          path: SupportWidget.routePath,
          builder: (context, params) => SupportWidget(),
        ),
        FFRoute(
          name: SupportStatusWidget.routeName,
          path: SupportStatusWidget.routePath,
          builder: (context, params) => SupportStatusWidget(),
        ),
        FFRoute(
          name: EditcarWidget.routeName,
          path: EditcarWidget.routePath,
          builder: (context, params) => EditcarWidget(
            vehicle: params.getParam<VehicleRow>(
              'vehicle',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: DetailsParkingWidget.routeName,
          path: DetailsParkingWidget.routePath,
          builder: (context, params) => DetailsParkingWidget(
            permit: params.getParam<PermitRow>(
              'permit',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: DetailFinesWidget.routeName,
          path: DetailFinesWidget.routePath,
          builder: (context, params) => DetailFinesWidget(
            compoundid: params.getParam<CompoundRow>(
              'compoundid',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: PayfinesWidget.routeName,
          path: PayfinesWidget.routePath,
          builder: (context, params) => PayfinesWidget(),
        ),
        FFRoute(
          name: TopupcodeWidget.routeName,
          path: TopupcodeWidget.routePath,
          builder: (context, params) => TopupcodeWidget(),
        ),
        FFRoute(
          name: PaymentConfirmedWidget.routeName,
          path: PaymentConfirmedWidget.routePath,
          builder: (context, params) => PaymentConfirmedWidget(
            payment: params.getParam(
              'payment',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: CardDetailsWidget.routeName,
          path: CardDetailsWidget.routePath,
          builder: (context, params) => CardDetailsWidget(
            amount: params.getParam(
              'amount',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: SupportticketWidget.routeName,
          path: SupportticketWidget.routePath,
          builder: (context, params) => SupportticketWidget(),
        ),
        FFRoute(
          name: SupportBugWidget.routeName,
          path: SupportBugWidget.routePath,
          builder: (context, params) => SupportBugWidget(),
        ),
        FFRoute(
          name: IssuescompoundWidget.routeName,
          path: IssuescompoundWidget.routePath,
          builder: (context, params) => IssuescompoundWidget(
            permit: params.getParam<PermitRow>(
              'permit',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: ScannerWidget.routeName,
          path: ScannerWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ScannerWidget(),
        ),
        FFRoute(
          name: ListOffenceWidget.routeName,
          path: ListOffenceWidget.routePath,
          builder: (context, params) => ListOffenceWidget(),
        ),
        FFRoute(
          name: CreateoffenceWidget.routeName,
          path: CreateoffenceWidget.routePath,
          builder: (context, params) => CreateoffenceWidget(),
        ),
        FFRoute(
          name: CompoundDashboardWidget.routeName,
          path: CompoundDashboardWidget.routePath,
          builder: (context, params) => CompoundDashboardWidget(),
        ),
        FFRoute(
          name: AdminBoardWidget.routeName,
          path: AdminBoardWidget.routePath,
          builder: (context, params) => AdminBoardWidget(),
        ),
        FFRoute(
          name: UserListWidget.routeName,
          path: UserListWidget.routePath,
          builder: (context, params) => UserListWidget(),
        ),
        FFRoute(
          name: StaffStatWidget.routeName,
          path: StaffStatWidget.routePath,
          builder: (context, params) => StaffStatWidget(),
        ),
        FFRoute(
          name: UserDetailsWidget.routeName,
          path: UserDetailsWidget.routePath,
          builder: (context, params) => UserDetailsWidget(
            user: params.getParam<UserRow>(
              'user',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: ProfiletestWidget.routeName,
          path: ProfiletestWidget.routePath,
          builder: (context, params) => ProfiletestWidget(),
        ),
        FFRoute(
          name: ListcarWidget.routeName,
          path: ListcarWidget.routePath,
          builder: (context, params) => ListcarWidget(
            user: params.getParam<UserRow>(
              'user',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: EnforcementlistWidget.routeName,
          path: EnforcementlistWidget.routePath,
          builder: (context, params) => EnforcementlistWidget(),
        ),
        FFRoute(
          name: VehicleDetailsWidget.routeName,
          path: VehicleDetailsWidget.routePath,
          builder: (context, params) => VehicleDetailsWidget(
            user: params.getParam<UserRow>(
              'user',
              ParamType.SupabaseRow,
            ),
            vehicleid: params.getParam<VehicleRow>(
              'vehicleid',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: SummayActivitiesWidget.routeName,
          path: SummayActivitiesWidget.routePath,
          builder: (context, params) => SummayActivitiesWidget(),
        ),
        FFRoute(
          name: TransactionparkingWidget.routeName,
          path: TransactionparkingWidget.routePath,
          builder: (context, params) => TransactionparkingWidget(),
        ),
        FFRoute(
          name: ListcompoundWidget.routeName,
          path: ListcompoundWidget.routePath,
          builder: (context, params) => ListcompoundWidget(),
        ),
        FFRoute(
          name: ListrequestWidget.routeName,
          path: ListrequestWidget.routePath,
          builder: (context, params) => ListrequestWidget(),
        ),
        FFRoute(
          name: SupportDetailsWidget.routeName,
          path: SupportDetailsWidget.routePath,
          builder: (context, params) => SupportDetailsWidget(
            id: params.getParam<SupportReqRow>(
              'id',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: ReplySupportWidget.routeName,
          path: ReplySupportWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ReplySupportWidget(
            req: params.getParam<SupportReqRow>(
              'req',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: UserTransactionWidget.routeName,
          path: UserTransactionWidget.routePath,
          builder: (context, params) => UserTransactionWidget(),
        ),
        FFRoute(
          name: PaymentFailedWidget.routeName,
          path: PaymentFailedWidget.routePath,
          builder: (context, params) => PaymentFailedWidget(
            payment: params.getParam(
              'payment',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: UserTransactionCopyWidget.routeName,
          path: UserTransactionCopyWidget.routePath,
          builder: (context, params) => UserTransactionCopyWidget(),
        ),
        FFRoute(
          name: SupportDetailsUserWidget.routeName,
          path: SupportDetailsUserWidget.routePath,
          builder: (context, params) => SupportDetailsUserWidget(
            id: params.getParam<SupportReqRow>(
              'id',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: TransactiontopupWidget.routeName,
          path: TransactiontopupWidget.routePath,
          builder: (context, params) => TransactiontopupWidget(),
        ),
        FFRoute(
          name: ReplySupportUserWidget.routeName,
          path: ReplySupportUserWidget.routePath,
          builder: (context, params) => ReplySupportUserWidget(
            req: params.getParam<SupportReqRow>(
              'req',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: FaqResetpassWidget.routeName,
          path: FaqResetpassWidget.routePath,
          builder: (context, params) => FaqResetpassWidget(),
        ),
        FFRoute(
          name: FaqUpdateprofileWidget.routeName,
          path: FaqUpdateprofileWidget.routePath,
          builder: (context, params) => FaqUpdateprofileWidget(),
        ),
        FFRoute(
          name: GeneratecouponcodeWidget.routeName,
          path: GeneratecouponcodeWidget.routePath,
          builder: (context, params) => GeneratecouponcodeWidget(),
        ),
        FFRoute(
          name: PaymentConfirmedtopupWidget.routeName,
          path: PaymentConfirmedtopupWidget.routePath,
          builder: (context, params) => PaymentConfirmedtopupWidget(
            payment: params.getParam(
              'payment',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: PaymentFailedtopupWidget.routeName,
          path: PaymentFailedtopupWidget.routePath,
          builder: (context, params) => PaymentFailedtopupWidget(
            payment: params.getParam(
              'payment',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: DetailFinesAdminWidget.routeName,
          path: DetailFinesAdminWidget.routePath,
          builder: (context, params) => DetailFinesAdminWidget(
            compoundid: params.getParam<CompoundRow>(
              'compoundid',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: HometestWidget.routeName,
          path: HometestWidget.routePath,
          builder: (context, params) => HometestWidget(),
        ),
        FFRoute(
          name: ListpermitWidget.routeName,
          path: ListpermitWidget.routePath,
          builder: (context, params) => ListpermitWidget(),
        ),
        FFRoute(
          name: DetailsPermitWidget.routeName,
          path: DetailsPermitWidget.routePath,
          builder: (context, params) => DetailsPermitWidget(
            permit: params.getParam<PermitRow>(
              'permit',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: ListSeasonalpassWidget.routeName,
          path: ListSeasonalpassWidget.routePath,
          builder: (context, params) => ListSeasonalpassWidget(),
        ),
        FFRoute(
          name: DetailSeasonalPassWidget.routeName,
          path: DetailSeasonalPassWidget.routePath,
          requireAuth: true,
          builder: (context, params) => DetailSeasonalPassWidget(
            passid: params.getParam<SeasonalPassRow>(
              'passid',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: SeasonalDetailsWidget.routeName,
          path: SeasonalDetailsWidget.routePath,
          builder: (context, params) => SeasonalDetailsWidget(),
        ),
        FFRoute(
          name: HistorySeasonalpassWidget.routeName,
          path: HistorySeasonalpassWidget.routePath,
          builder: (context, params) => HistorySeasonalpassWidget(),
        ),
        FFRoute(
          name: AdminTransactionWidget.routeName,
          path: AdminTransactionWidget.routePath,
          builder: (context, params) => AdminTransactionWidget(),
        ),
        FFRoute(
          name: HomeadasWidget.routeName,
          path: HomeadasWidget.routePath,
          builder: (context, params) => HomeadasWidget(),
        ),
        FFRoute(
          name: TransactioncompoundWidget.routeName,
          path: TransactioncompoundWidget.routePath,
          builder: (context, params) => TransactioncompoundWidget(),
        ),
        FFRoute(
          name: ListLocationWidget.routeName,
          path: ListLocationWidget.routePath,
          builder: (context, params) => ListLocationWidget(),
        ),
        FFRoute(
          name: AddLocationWidget.routeName,
          path: AddLocationWidget.routePath,
          builder: (context, params) => AddLocationWidget(),
        ),
        FFRoute(
          name: EditLocationWidget.routeName,
          path: EditLocationWidget.routePath,
          builder: (context, params) => EditLocationWidget(
            location: params.getParam<ParkingLocationRow>(
              'location',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: ReviewWidget.routeName,
          path: ReviewWidget.routePath,
          builder: (context, params) => ReviewWidget(),
        ),
        FFRoute(
          name: ListReviewWidget.routeName,
          path: ListReviewWidget.routePath,
          builder: (context, params) => ListReviewWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/auth';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/iPhone_16_-_1.png',
                    fit: BoxFit.fitWidth,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
