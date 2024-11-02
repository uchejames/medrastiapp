import '/flutter_flow/flutter_flow_util.dart';
import 'full_course_details_widget.dart' show FullCourseDetailsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class FullCourseDetailsModel extends FlutterFlowModel<FullCourseDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
  }
}
