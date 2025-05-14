import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'details_parking_widget.dart' show DetailsParkingWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class DetailsParkingModel extends FlutterFlowModel<DetailsParkingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for start widget.
  FocusNode? startFocusNode;
  TextEditingController? startTextController;
  String? Function(BuildContext, String?)? startTextControllerValidator;
  // State field(s) for end widget.
  FocusNode? endFocusNode;
  TextEditingController? endTextController;
  String? Function(BuildContext, String?)? endTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    startFocusNode?.dispose();
    startTextController?.dispose();

    endFocusNode?.dispose();
    endTextController?.dispose();
  }
}
