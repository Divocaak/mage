import 'package:flutter/material.dart';

class FormText extends StatelessWidget {
  FormText(
      {Key? key,
      required String hint,
      String? helperText,
      bool? obscure,
      int? maxLen,
      IconData? icon})
      : _hint = hint,
        _helperText = helperText ?? "",
        _obscure = obscure ?? false,
        _maxLen = maxLen,
        _icon = icon,
        super(key: key);

  String? _value;
  final String _hint;
  final String _helperText;
  final bool _obscure;
  final int? _maxLen;
  final IconData? _icon;

  getValue() => _value;

  @override
  Widget build(BuildContext context) => TextFormField(
      decoration: InputDecoration(
          label: Text(_hint),
          helperText: _helperText,
          icon: (_icon != null ? Icon(_icon) : null)),
      keyboardType: TextInputType.text,
      obscureText: _obscure,
      maxLength: _maxLen,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (String? value) => value!.isEmpty ? "Mandatory field" : null,
      onSaved: (String? value) => _value = value);
}
