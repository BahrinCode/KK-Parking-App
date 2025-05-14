import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'topupcode_model.dart';
export 'topupcode_model.dart';

class TopupcodeWidget extends StatefulWidget {
  const TopupcodeWidget({super.key});

  static String routeName = 'topupcode';
  static String routePath = '/topupcode';

  @override
  State<TopupcodeWidget> createState() => _TopupcodeWidgetState();
}

class _TopupcodeWidgetState extends State<TopupcodeWidget> {
  late TopupcodeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopupcodeModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WalletRow>>(
      future: WalletTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitDoubleBounce(
                  color: FlutterFlowTheme.of(context).tertiary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<WalletRow> topupcodeWalletRowList = snapshot.data!;

        final topupcodeWalletRow = topupcodeWalletRowList.isNotEmpty
            ? topupcodeWalletRowList.first
            : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).tertiary,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Coupon Code',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: FutureBuilder<List<CouponcodeRow>>(
                future: CouponcodeTable().querySingleRow(
                  queryFn: (q) => q,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitDoubleBounce(
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  List<CouponcodeRow> columnCouponcodeRowList = snapshot.data!;

                  final columnCouponcodeRow = columnCouponcodeRowList.isNotEmpty
                      ? columnCouponcodeRowList.first
                      : null;

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 48.0, 0.0, 0.0),
                            child: Text(
                              'Please enter Coupon Code below.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 48.0, 24.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5.0,
                                color: Color(0x3416202A),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                                spreadRadius: 0.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: FutureBuilder<List<CouponcodeRow>>(
                            future: CouponcodeTable().querySingleRow(
                              queryFn: (q) => q,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitDoubleBounce(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<CouponcodeRow> textFieldCouponcodeRowList =
                                  snapshot.data!;

                              final textFieldCouponcodeRow =
                                  textFieldCouponcodeRowList.isNotEmpty
                                      ? textFieldCouponcodeRowList.first
                                      : null;

                              return TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Coupon Code',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                minLines: 1,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              );
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 100.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              var _shouldSetState = false;
                              _model.code = await CouponcodeTable().queryRows(
                                queryFn: (q) => q,
                              );
                              _shouldSetState = true;
                              if (_model.textController.text ==
                                  columnCouponcodeRow?.code) {
                                if (!columnCouponcodeRow!.isUsed!) {
                                  await TransactionTable().insert({
                                    'transaction_type': 'Topup',
                                    'amount':
                                        columnCouponcodeRow?.amount?.toDouble(),
                                    'user_id': currentUserUid,
                                    'status': 'Success',
                                  });
                                  await WalletTable().update(
                                    data: {
                                      'balance': functions.updateWalletFunction(
                                          topupcodeWalletRow!.balance!,
                                          columnCouponcodeRow!.amount
                                              .toDouble()),
                                      'last_updated': supaSerialize<DateTime>(
                                          functions.updatedTimeFunction()),
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'user_id',
                                      currentUserUid,
                                    ),
                                  );
                                  await CouponcodeTable().update(
                                    data: {
                                      'isUsed': true,
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'code',
                                      _model.textController.text,
                                    ),
                                  );

                                  context.pushNamed(
                                    PaymentConfirmedtopupWidget.routeName,
                                    queryParameters: {
                                      'payment': serializeParam(
                                        columnCouponcodeRow?.amount?.toDouble(),
                                        ParamType.double,
                                      ),
                                    }.withoutNulls,
                                  );

                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  await TransactionTable().insert({
                                    'transaction_type': 'Topup',
                                    'amount':
                                        columnCouponcodeRow?.amount?.toDouble(),
                                    'user_id': currentUserUid,
                                    'status': 'Failed',
                                  });

                                  context.pushNamed(
                                    PaymentFailedtopupWidget.routeName,
                                    queryParameters: {
                                      'payment': serializeParam(
                                        columnCouponcodeRow?.amount?.toDouble(),
                                        ParamType.double,
                                      ),
                                    }.withoutNulls,
                                  );
                                }
                              } else {
                                context.pushNamed(
                                  PaymentFailedtopupWidget.routeName,
                                  queryParameters: {
                                    'payment': serializeParam(
                                      0.0,
                                      ParamType.double,
                                    ),
                                  }.withoutNulls,
                                );
                              }

                              if (_shouldSetState) safeSetState(() {});
                            },
                            text: 'Topup',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
