import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'languages_model.dart';
export 'languages_model.dart';

class LanguagesWidget extends StatefulWidget {
  const LanguagesWidget({super.key});

  @override
  State<LanguagesWidget> createState() => _LanguagesWidgetState();
}

class _LanguagesWidgetState extends State<LanguagesWidget> {
  late LanguagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LanguagesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        FlutterFlowLanguageSelector(
          width: double.infinity,
          height: 50.0,
          backgroundColor: FlutterFlowTheme.of(context).tertiary,
          borderColor: Colors.transparent,
          dropdownIconColor: Colors.white,
          borderRadius: 8.0,
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 13.0,
          ),
          hideFlags: true,
          flagSize: 24.0,
          flagTextGap: 8.0,
          currentLanguage: FFLocalizations.of(context).languageCode,
          languages: FFLocalizations.languages(),
          onChanged: (lang) => setAppLanguage(context, lang),
        ),
      ],
    );
  }
}
