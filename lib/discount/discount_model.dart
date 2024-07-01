import '/flutter_flow/flutter_flow_util.dart';
import 'discount_widget.dart' show DiscountWidget;
import 'package:flutter/material.dart';

class DiscountModel extends FlutterFlowModel<DiscountWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
