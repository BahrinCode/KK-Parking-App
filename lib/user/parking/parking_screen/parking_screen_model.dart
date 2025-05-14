import '/auth/firebase_auth/auth_util.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/user/parking/warning_empty/warning_empty_widget.dart';
import '/user/wallet/warning_wallet/warning_wallet_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:styled_divider/styled_divider.dart';
import 'parking_screen_widget.dart' show ParkingScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ParkingScreenModel extends FlutterFlowModel<ParkingScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for plate_no widget.
  String? plateNoValue;
  FormFieldController<String>? plateNoValueController;
  // State field(s) for rate widget.
  String? rateValue;
  FormFieldController<String>? rateValueController;
  // State field(s) for parkinglocation widget.
  String? parkinglocationValue;
  FormFieldController<String>? parkinglocationValueController;
  Stream<List<ParkingLocationRow>>? parkinglocationSupabaseStream;
  // State field(s) for hour widget.
  double? hourValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
