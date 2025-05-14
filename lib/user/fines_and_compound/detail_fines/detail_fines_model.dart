import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import 'detail_fines_widget.dart' show DetailFinesWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailFinesModel extends FlutterFlowModel<DetailFinesWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (One-Time Payment (Mobile))] action in Button widget.
  ApiCallResponse? apiPayment;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
