import 'package:flutter/material.dart';

typedef StringCallBack = String Function(String);

class TextFromField extends StatelessWidget {
  const TextFromField({
    Key key,
    @required this.fieldInitialValue,
    @required this.validator,
    @required this.onSaved,
    @required this.name,
    this.hintText,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
  }) : super(key: key);

  final dynamic fieldInitialValue;
  final AutovalidateMode autoValidateMode;
  final StringCallBack validator;
  final void Function(String, String) onSaved;
  final String name;
  final hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        autovalidateMode: autoValidateMode,
        initialValue: fieldInitialValue,
        validator: validator,
        onSaved: (text) => onSaved(name, text),
        decoration: InputDecoration(
          focusColor: Colors.white,
          labelText: fieldInitialValue,
          hintText: hintText,
          // labelStyle: TextStyle(color: Colors.green),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}
