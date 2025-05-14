import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'addcar_widget.dart' show AddcarWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddcarModel extends FlutterFlowModel<AddcarWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for plateno widget.
  FocusNode? platenoFocusNode;
  TextEditingController? platenoTextController;
  String? Function(BuildContext, String?)? platenoTextControllerValidator;
  // State field(s) for year widget.
  FocusNode? yearFocusNode;
  TextEditingController? yearTextController;
  String? Function(BuildContext, String?)? yearTextControllerValidator;
  // State field(s) for model widget.
  String? modelValue;
  FormFieldController<String>? modelValueController;
  // State field(s) for vehicletype widget.
  String? vehicletypeValue;
  FormFieldController<String>? vehicletypeValueController;
  // State field(s) for color widget.
  String? colorValue;
  FormFieldController<String>? colorValueController;
  // State field(s) for defaultcar widget.
  bool? defaultcarValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    platenoFocusNode?.dispose();
    platenoTextController?.dispose();

    yearFocusNode?.dispose();
    yearTextController?.dispose();
  }
}
