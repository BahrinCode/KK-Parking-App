import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start FlutterFlow + Stripe ApiFlow API Group Code

class FlutterFlowStripeApiFlowAPIGroup {
  static String getBaseUrl() =>
      'https://gw.apiflow.online/api/1efa6f51e0864250bc19f3baf24b724f';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer NmNhZmQyYWZmZjQzNWVmYWI5Y2E1ZTc3MzNkZDljMWY6YTMxZTQ1ZDk3ZmExNzkyMGQ5M2MxMTIyZjUwZmVmZWI=',
  };
  static OneTimePaymentMobileCall oneTimePaymentMobileCall =
      OneTimePaymentMobileCall();
  static SetupSubscriptionMobileCall setupSubscriptionMobileCall =
      SetupSubscriptionMobileCall();
  static SaveSubscriptionMobileCall saveSubscriptionMobileCall =
      SaveSubscriptionMobileCall();
  static SaveSubscriptionForPriceIDMobileCall
      saveSubscriptionForPriceIDMobileCall =
      SaveSubscriptionForPriceIDMobileCall();
  static CreatePaymentLinkWebCall createPaymentLinkWebCall =
      CreatePaymentLinkWebCall();
  static CreateSubscriptionLinkWebCall createSubscriptionLinkWebCall =
      CreateSubscriptionLinkWebCall();
  static CreateSubscriptionLinkForPriceIDWebCall
      createSubscriptionLinkForPriceIDWebCall =
      CreateSubscriptionLinkForPriceIDWebCall();
}

class OneTimePaymentMobileCall {
  Future<ApiCallResponse> call({
    String? amount = '',
    String? currency = '',
    String? description = '',
    String? email = '',
    String? name = '',
    String? phone = '',
    String? line1 = '',
    String? line2 = '',
    String? city = '',
    String? state = '',
    String? country = '',
    String? postalCode = '',
    String? code = '',
  }) async {
    final baseUrl = FlutterFlowStripeApiFlowAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'One-Time Payment (Mobile)',
      apiUrl:
          '${baseUrl}/payments/mobile?amount=${amount}&currency=${currency}&description=${description}&email=${email}&name=${name}&phone=${phone}&line1=${line1}&line2=${line2}&city=${city}&state=${state}&country=${country}&postalCode=${postalCode}&code=${code}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer NmNhZmQyYWZmZjQzNWVmYWI5Y2E1ZTc3MzNkZDljMWY6YTMxZTQ1ZDk3ZmExNzkyMGQ5M2MxMTIyZjUwZmVmZWI=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SetupSubscriptionMobileCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? name = '',
    String? phone = '',
    String? line1 = '',
    String? line2 = '',
    String? city = '',
    String? state = '',
    String? country = '',
    String? postalCode = '',
  }) async {
    final baseUrl = FlutterFlowStripeApiFlowAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Setup Subscription (Mobile)',
      apiUrl:
          '${baseUrl}/subscriptions/mobile/setup?email=${email}&name=${name}&phone=${phone}&line1=${line1}&line2=${line2}&city=${city}&state=${state}&country=${country}&postalCode=${postalCode}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer NmNhZmQyYWZmZjQzNWVmYWI5Y2E1ZTc3MzNkZDljMWY6YTMxZTQ1ZDk3ZmExNzkyMGQ5M2MxMTIyZjUwZmVmZWI=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SaveSubscriptionMobileCall {
  Future<ApiCallResponse> call({
    String? customer = '',
    String? product = '',
    String? amount = '',
    String? currency = '',
    String? interval = '',
    int? intervalCount,
    String? description = '',
    String? code = '',
    int? trial,
  }) async {
    final baseUrl = FlutterFlowStripeApiFlowAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Save Subscription (Mobile)',
      apiUrl:
          '${baseUrl}/subscriptions/mobile/save/withamount?customer=${customer}&product=${product}&amount=${amount}&currency=${currency}&interval=${interval}&intervalCount=${intervalCount}&description=${description}&code=${code}&trial=${trial}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer NmNhZmQyYWZmZjQzNWVmYWI5Y2E1ZTc3MzNkZDljMWY6YTMxZTQ1ZDk3ZmExNzkyMGQ5M2MxMTIyZjUwZmVmZWI=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SaveSubscriptionForPriceIDMobileCall {
  Future<ApiCallResponse> call({
    String? priceId = '',
    String? customer = '',
    int? trial,
  }) async {
    final baseUrl = FlutterFlowStripeApiFlowAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Save Subscription for Price ID (Mobile)',
      apiUrl:
          '${baseUrl}/subscriptions/mobile/save/forproduct?priceId=${priceId}&customer=${customer}&trial=${trial}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer NmNhZmQyYWZmZjQzNWVmYWI5Y2E1ZTc3MzNkZDljMWY6YTMxZTQ1ZDk3ZmExNzkyMGQ5M2MxMTIyZjUwZmVmZWI=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreatePaymentLinkWebCall {
  Future<ApiCallResponse> call({
    String? amount = '',
    String? currency = '',
    String? description = '',
    String? email = '',
    String? name = '',
    String? phone = '',
    String? line1 = '',
    String? line2 = '',
    String? city = '',
    String? state = '',
    String? country = '',
    String? postalCode = '',
    String? code = '',
    String? successUrl = '',
    String? cancelUrl = '',
  }) async {
    final baseUrl = FlutterFlowStripeApiFlowAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "successUrl": "${escapeStringForJson(successUrl)}",
  "cancelUrl": "${escapeStringForJson(cancelUrl)}",
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Payment Link (Web)',
      apiUrl:
          '${baseUrl}/payments/web/withamount?amount=${amount}&currency=${currency}&description=${description}&email=${email}&name=${name}&phone=${phone}&line1=${line1}&line2=${line2}&city=${city}&state=${state}&country=${country}&postalCode=${postalCode}&code=${code}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer NmNhZmQyYWZmZjQzNWVmYWI5Y2E1ZTc3MzNkZDljMWY6YTMxZTQ1ZDk3ZmExNzkyMGQ5M2MxMTIyZjUwZmVmZWI=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateSubscriptionLinkWebCall {
  Future<ApiCallResponse> call({
    String? amount = '',
    String? currency = '',
    String? description = '',
    String? email = '',
    String? name = '',
    String? phone = '',
    String? line1 = '',
    String? line2 = '',
    String? city = '',
    String? state = '',
    String? country = '',
    String? postalCode = '',
    String? code = '',
  }) async {
    final baseUrl = FlutterFlowStripeApiFlowAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "successUrl": "<successUrl>",
  "cancelUrl": "<cancelUrl>",
  "metadata": {},
  "intervalCount": 1,
  "interval": "month",
  "trial": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Subscription Link (Web)',
      apiUrl:
          '${baseUrl}/subscriptions/web/withamount?amount=${amount}&currency=${currency}&description=${description}&email=${email}&name=${name}&phone=${phone}&line1=${line1}&line2=${line2}&city=${city}&state=${state}&country=${country}&postalCode=${postalCode}&code=${code}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer NmNhZmQyYWZmZjQzNWVmYWI5Y2E1ZTc3MzNkZDljMWY6YTMxZTQ1ZDk3ZmExNzkyMGQ5M2MxMTIyZjUwZmVmZWI=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateSubscriptionLinkForPriceIDWebCall {
  Future<ApiCallResponse> call({
    String? priceId = '',
    String? email = '',
    String? name = '',
    String? phone = '',
    String? code = '',
    int? trial,
  }) async {
    final baseUrl = FlutterFlowStripeApiFlowAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
""''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Subscription Link for Price ID (Web)',
      apiUrl:
          '${baseUrl}/subscriptions/web/forproduct?priceId=${priceId}&email=${email}&name=${name}&phone=${phone}&code=${code}&trial=${trial}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer NmNhZmQyYWZmZjQzNWVmYWI5Y2E1ZTc3MzNkZDljMWY6YTMxZTQ1ZDk3ZmExNzkyMGQ5M2MxMTIyZjUwZmVmZWI=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End FlutterFlow + Stripe ApiFlow API Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
