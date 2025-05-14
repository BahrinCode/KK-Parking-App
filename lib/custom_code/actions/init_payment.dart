// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_stripe/flutter_stripe.dart';

Future<bool> initPayment(String clientSecret) async {
  var success = false;
  try {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        customFlow: false,
        merchantDisplayName: 'KK Park',
        //This will init payment sheet with payment details, like amount and customer
        paymentIntentClientSecret: clientSecret,
        // Extra options
        applePay: null,
        googlePay: const PaymentSheetGooglePay(
          merchantCountryCode: 'MY',
          testEnv: true, //remove this to enable production
        ),
        style: ThemeMode.system,
      ),
    );

    await Stripe.instance.presentPaymentSheet().then((value) {
      //any custom code on payment success
      success = true;
    }).onError((error, stackTrace) {
      //any custom code on error
      throw Exception(error);
    });
  } catch (e) {
    rethrow;
  }

  return success;
}
