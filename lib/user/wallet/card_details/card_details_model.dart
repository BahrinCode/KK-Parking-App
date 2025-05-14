import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'card_details_widget.dart' show CardDetailsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CardDetailsModel extends FlutterFlowModel<CardDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  final textFieldMask = MaskTextInputFormatter(mask: '#### #### #### ####');
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for expire widget.
  FocusNode? expireFocusNode;
  TextEditingController? expireTextController;
  final expireMask = MaskTextInputFormatter(mask: '##/##');
  String? Function(BuildContext, String?)? expireTextControllerValidator;
  // State field(s) for cvv widget.
  FocusNode? cvvFocusNode;
  TextEditingController? cvvTextController;
  String? Function(BuildContext, String?)? cvvTextControllerValidator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    expireFocusNode?.dispose();
    expireTextController?.dispose();

    cvvFocusNode?.dispose();
    cvvTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }
}
