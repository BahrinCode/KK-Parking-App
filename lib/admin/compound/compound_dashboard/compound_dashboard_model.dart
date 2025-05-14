import '/admin/nav_admin/nav_admin_widget.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'compound_dashboard_widget.dart' show CompoundDashboardWidget;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompoundDashboardModel extends FlutterFlowModel<CompoundDashboardWidget> {
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
