import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode1;
  TextEditingController? cityTextController1;
  String? Function(BuildContext, String?)? cityTextController1Validator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode2;
  TextEditingController? cityTextController2;
  String? Function(BuildContext, String?)? cityTextController2Validator;
  // State field(s) for city widget.
  String? cityValue;
  FormFieldController<String>? cityValueController;
  // State field(s) for city widget.
  FocusNode? cityFocusNode3;
  TextEditingController? cityTextController3;
  String? Function(BuildContext, String?)? cityTextController3Validator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode4;
  TextEditingController? cityTextController4;
  String? Function(BuildContext, String?)? cityTextController4Validator;
  // State field(s) for state widget.
  String? stateValue;
  FormFieldController<String>? stateValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    cityFocusNode1?.dispose();
    cityTextController1?.dispose();

    cityFocusNode2?.dispose();
    cityTextController2?.dispose();

    cityFocusNode3?.dispose();
    cityTextController3?.dispose();

    cityFocusNode4?.dispose();
    cityTextController4?.dispose();
  }
}
