import '/admin/main/adminview/adminview_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'admin_board_widget.dart' show AdminBoardWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminBoardModel extends FlutterFlowModel<AdminBoardWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for adminview component.
  late AdminviewModel adminviewModel;

  @override
  void initState(BuildContext context) {
    adminviewModel = createModel(context, () => AdminviewModel());
  }

  @override
  void dispose() {
    adminviewModel.dispose();
  }
}
