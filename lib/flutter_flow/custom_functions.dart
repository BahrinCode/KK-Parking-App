import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

double newSumCustomFunction(
  String rate,
  double hour,
) {
  double sum = 0;

  if (hour != null && rate != null) {
    if (rate == "Yellow Box") {
      // Yellow box logic
      if (hour <= 4) {
        // First 8 x 30 minutes = 4 hours
        sum = 0.53 * (hour * 2);
      } else {
        // Beyond 4 hours
        sum = 0.53 * 8 + 1.06 * ((hour - 4) * 2);
      }
    } else if (rate == "Green Box") {
      // Green box logic
      sum = 0.53 * hour;
    } else if (rate == "Red Box") {
      // Red box logic
      if (hour <= 1) {
        // First hour (2 x 30 minutes)
        sum = 1.06 * (hour * 2);
      } else if (hour <= 2) {
        // Second hour (3rd and 4th 30 minutes)
        sum = 1.06 * 2 + 2.12 * ((hour - 1) * 2);
      } else {
        // Maximum 2 hours, no more charges
        sum = 1.06 * 2 + 2.12 * 2;
      }
    } else {}
  }

  return sum;
}

DateTimeRange endtimeFunction(double hour) {
  if (hour != null && hour > 0) {
    DateTime now = DateTime.now(); // Current time
    DateTime end = now.add(Duration(minutes: (hour * 60).toInt())); // End time
    return DateTimeRange(start: now, end: end); // Return the DateTimeRange
  } else {
    throw ArgumentError("Invalid input: hour must be greater than 0.");
  }
}

double updatedBalanceFunction(
  double sumparking,
  double walletBalance,
) {
  if (walletBalance >= sumparking) {
    // Deduct the amount and return the updated balance
    return walletBalance - sumparking;
  } else {
    // Throw an error or return a specific value to indicate insufficient balance
    throw Exception('Insufficient Wallet Balance');
  }
}

double calculateProgressBarValue(
  int startTime,
  int endTime,
) {
  int nowUnix = DateTime.now().millisecondsSinceEpoch;

  // Calculate total duration and elapsed time
  if (nowUnix >= endTime) {
    return 1.0;
  }

  return ((nowUnix - startTime) / (endTime - startTime));
}

double updateWalletFunction(
  double balance,
  double topup,
) {
  return balance + topup;
}

DateTime updatedTimeFunction() {
  return DateTime.now();
}

double percentagevalue(
  int start,
  int end,
) {
  int nowUnix = DateTime.now().millisecondsSinceEpoch;

  // Calculate total duration and elapsed time
  if (nowUnix >= end) {
    return 1.0;
  }

  double bar = ((nowUnix - start) / (end - start));

  return bar;
}

int changeunixFunction(DateTime time) {
  int unix = time.millisecondsSinceEpoch;

  return unix;
}

int newCustomFunction(int indek) {
  int k = indek + 1;

  return k;
}

DateTime next30Function() {
  return DateTime.now().add(Duration(days: 30));
}

double sumTransaction(
  double app,
  double supa,
) {
  return app + supa;
}
