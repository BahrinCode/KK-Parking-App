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

Future initStripe() async {
  Stripe.publishableKey =
      'pk_test_51J1VJdGHOlGzjLnj8VvdXkd9a4O9tjIvZLw7VPLEUtf3RgznpQqD9oAEgEGtA0tOD9gYHcZxhSgvqrex1VFbBwk700IPgF1bk8';

  Stripe.instance.applySettings();
}
