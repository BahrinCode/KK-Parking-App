import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'user_info_widget.dart' show UserInfoWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserInfoModel extends FlutterFlowModel<UserInfoWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for uname widget.
  FocusNode? unameFocusNode;
  TextEditingController? unameTextController;
  String? Function(BuildContext, String?)? unameTextControllerValidator;
  // State field(s) for fname widget.
  FocusNode? fnameFocusNode;
  TextEditingController? fnameTextController;
  String? Function(BuildContext, String?)? fnameTextControllerValidator;
  // State field(s) for uemail widget.
  FocusNode? uemailFocusNode;
  TextEditingController? uemailTextController;
  String? Function(BuildContext, String?)? uemailTextControllerValidator;
  // State field(s) for uPhone widget.
  FocusNode? uPhoneFocusNode;
  TextEditingController? uPhoneTextController;
  String? Function(BuildContext, String?)? uPhoneTextControllerValidator;
  // State field(s) for uaddress widget.
  FocusNode? uaddressFocusNode;
  TextEditingController? uaddressTextController;
  String? Function(BuildContext, String?)? uaddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unameFocusNode?.dispose();
    unameTextController?.dispose();

    fnameFocusNode?.dispose();
    fnameTextController?.dispose();

    uemailFocusNode?.dispose();
    uemailTextController?.dispose();

    uPhoneFocusNode?.dispose();
    uPhoneTextController?.dispose();

    uaddressFocusNode?.dispose();
    uaddressTextController?.dispose();
  }
}
