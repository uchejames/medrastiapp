import '/flutter_flow/flutter_flow_util.dart';
import 'ggg_widget.dart' show GggWidget;
import 'package:flutter/material.dart';

class GggModel extends FlutterFlowModel<GggWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
