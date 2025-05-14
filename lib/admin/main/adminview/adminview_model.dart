import '/admin/nav_admin/nav_admin_widget.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'adminview_widget.dart' show AdminviewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class AdminviewModel extends FlutterFlowModel<AdminviewWidget> {
  ///  State fields for stateful widgets in this component.

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
