import '/flutter_flow/flutter_flow_util.dart';
import 'courses_list_widget.dart' show CoursesListWidget;
import 'package:flutter/material.dart';

class CoursesListModel extends FlutterFlowModel<CoursesListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
