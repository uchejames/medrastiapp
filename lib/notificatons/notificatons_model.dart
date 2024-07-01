import '/flutter_flow/flutter_flow_util.dart';
import 'notificatons_widget.dart' show NotificatonsWidget;
import 'package:flutter/material.dart';

class NotificatonsModel extends FlutterFlowModel<NotificatonsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
