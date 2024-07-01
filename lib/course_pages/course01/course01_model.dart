import '/flutter_flow/flutter_flow_util.dart';
import 'course01_widget.dart' show Course01Widget;
import 'package:flutter/material.dart';

class Course01Model extends FlutterFlowModel<Course01Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
