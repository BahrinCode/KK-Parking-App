import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/iPhone_16_-_1.png',
            fit: BoxFit.fitWidth,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'AuthUser': ParameterData.none(),
  'Profile': ParameterData.none(),
  'Home': (data) async => ParameterData(
        allParams: {},
      ),
  'Notification': ParameterData.none(),
  'ForgotPass': ParameterData.none(),
  'AddPark': ParameterData.none(),
  'history': ParameterData.none(),
  'Location': (data) async => ParameterData(
        allParams: {},
      ),
  'mycar': ParameterData.none(),
  'Addcar': ParameterData.none(),
  'userInfo': ParameterData.none(),
  'ParkingScreen': ParameterData.none(),
  'compound': ParameterData.none(),
  'topup_wallet': ParameterData.none(),
  'Setting': ParameterData.none(),
  'editprofile': ParameterData.none(),
  'profileview': ParameterData.none(),
  'support': ParameterData.none(),
  'support_status': ParameterData.none(),
  'editcar': (data) async => ParameterData(
        allParams: {},
      ),
  'details_parking': (data) async => ParameterData(
        allParams: {},
      ),
  'detail_fines': (data) async => ParameterData(
        allParams: {},
      ),
  'payfines': ParameterData.none(),
  'topupcode': ParameterData.none(),
  'payment_confirmed': (data) async => ParameterData(
        allParams: {
          'payment': getParameter<double>(data, 'payment'),
        },
      ),
  'card_details': (data) async => ParameterData(
        allParams: {
          'amount': getParameter<double>(data, 'amount'),
        },
      ),
  'supportticket': ParameterData.none(),
  'support_bug': ParameterData.none(),
  'Issuescompound': (data) async => ParameterData(
        allParams: {},
      ),
  'scanner': ParameterData.none(),
  'list_offence': ParameterData.none(),
  'createoffence': ParameterData.none(),
  'Compound_dashboard': ParameterData.none(),
  'admin_board': ParameterData.none(),
  'user_list': ParameterData.none(),
  'staff_stat': ParameterData.none(),
  'user_details': (data) async => ParameterData(
        allParams: {},
      ),
  'profiletest': ParameterData.none(),
  'listcar': (data) async => ParameterData(
        allParams: {},
      ),
  'enforcementlist': ParameterData.none(),
  'vehicle_details': (data) async => ParameterData(
        allParams: {},
      ),
  'summay_activities': ParameterData.none(),
  'transactionparking': ParameterData.none(),
  'listcompound': ParameterData.none(),
  'Listrequest': ParameterData.none(),
  'support_details': (data) async => ParameterData(
        allParams: {},
      ),
  'reply_support': (data) async => ParameterData(
        allParams: {},
      ),
  'user_transaction': ParameterData.none(),
  'payment_failed': (data) async => ParameterData(
        allParams: {
          'payment': getParameter<double>(data, 'payment'),
        },
      ),
  'user_transactionCopy': ParameterData.none(),
  'support_details_user': (data) async => ParameterData(
        allParams: {},
      ),
  'transactiontopup': ParameterData.none(),
  'reply_support_user': (data) async => ParameterData(
        allParams: {},
      ),
  'faq_resetpass': ParameterData.none(),
  'faq_updateprofile': ParameterData.none(),
  'generatecouponcode': ParameterData.none(),
  'payment_confirmedtopup': (data) async => ParameterData(
        allParams: {
          'payment': getParameter<double>(data, 'payment'),
        },
      ),
  'payment_failedtopup': (data) async => ParameterData(
        allParams: {
          'payment': getParameter<double>(data, 'payment'),
        },
      ),
  'detail_fines_admin': (data) async => ParameterData(
        allParams: {},
      ),
  'hometest': ParameterData.none(),
  'listpermit': ParameterData.none(),
  'details_Permit': (data) async => ParameterData(
        allParams: {},
      ),
  'List_seasonalpass': ParameterData.none(),
  'detail_seasonalPass': (data) async => ParameterData(
        allParams: {},
      ),
  'seasonal_details': ParameterData.none(),
  'history_seasonalpass': ParameterData.none(),
  'admin_transaction': ParameterData.none(),
  'homeadas': ParameterData.none(),
  'transactioncompound': ParameterData.none(),
  'List_Location': ParameterData.none(),
  'Add_Location': ParameterData.none(),
  'Edit_location': (data) async => ParameterData(
        allParams: {},
      ),
  'review': ParameterData.none(),
  'List_Review': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
