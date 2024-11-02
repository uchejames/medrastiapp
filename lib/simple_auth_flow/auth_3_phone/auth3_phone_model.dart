import '/flutter_flow/flutter_flow_util.dart';
import 'auth3_phone_widget.dart' show Auth3PhoneWidget;
import 'package:flutter/material.dart';

class Auth3PhoneModel extends FlutterFlowModel<Auth3PhoneWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
