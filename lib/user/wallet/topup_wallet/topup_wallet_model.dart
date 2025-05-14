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
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'topup_wallet_widget.dart' show TopupWalletWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class TopupWalletModel extends FlutterFlowModel<TopupWalletWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for topupamount widget.
  FocusNode? topupamountFocusNode;
  TextEditingController? topupamountTextController;
  final topupamountMask = MaskTextInputFormatter(mask: '##.##.####');
  String? Function(BuildContext, String?)? topupamountTextControllerValidator;
  // Stores action output result for [Backend Call - API (One-Time Payment (Mobile))] action in Row widget.
  ApiCallResponse? apiPayment;
  // Stores action output result for [Custom Action - initPayment] action in Row widget.
  bool? paymentStatus;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    topupamountFocusNode?.dispose();
    topupamountTextController?.dispose();
  }
}
