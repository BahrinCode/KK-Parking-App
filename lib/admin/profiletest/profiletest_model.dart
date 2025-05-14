import '/admin/nav_admin/nav_admin_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'profiletest_widget.dart' show ProfiletestWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfiletestModel extends FlutterFlowModel<ProfiletestWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for nav_admin component.
  late NavAdminModel navAdminModel;

  @override
  void initState(BuildContext context) {
    navAdminModel = createModel(context, () => NavAdminModel());
  }

  @override
  void dispose() {
    navAdminModel.dispose();
  }
}
