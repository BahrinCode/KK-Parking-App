import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'issuescompound_widget.dart' show IssuescompoundWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IssuescompoundModel extends FlutterFlowModel<IssuescompoundWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for vehicle_no widget.
  FocusNode? vehicleNoFocusNode;
  TextEditingController? vehicleNoTextController;
  String? Function(BuildContext, String?)? vehicleNoTextControllerValidator;
  // State field(s) for location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationTextController;
  String? Function(BuildContext, String?)? locationTextControllerValidator;
  // State field(s) for Offence widget.
  String? offenceValue;
  FormFieldController<String>? offenceValueController;
  // State field(s) for amount widget.
  double? amountValue;
  FormFieldController<double>? amountValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    vehicleNoFocusNode?.dispose();
    vehicleNoTextController?.dispose();

    locationFocusNode?.dispose();
    locationTextController?.dispose();
  }
}
