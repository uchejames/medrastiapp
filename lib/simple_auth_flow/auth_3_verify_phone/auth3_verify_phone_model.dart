import '/flutter_flow/flutter_flow_util.dart';
import 'auth3_verify_phone_widget.dart' show Auth3VerifyPhoneWidget;
import 'package:flutter/material.dart';

class Auth3VerifyPhoneModel extends FlutterFlowModel<Auth3VerifyPhoneWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pinCodeController?.dispose();
  }
}
