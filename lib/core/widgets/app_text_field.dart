import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController _textEditingController;
  final String _hintText;
  final IconData _iconData;
  final TextInputType _textInputType;
  final TextInputAction _textInputAction;
  final bool _obsecureText;
  final void Function(String value)? _onSubmitted;


  const AppTextField({
    super.key,
    required TextEditingController textEditingController,
    required String hintText,
    required IconData iconData,
    TextInputType textInputType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.next,
    bool obsecureText = false,
    void Function(String value)? onSubmitted,
  }):
  _textEditingController = textEditingController,
  _hintText = hintText,
  _iconData = iconData,
  _textInputType = textInputType,
  _textInputAction = textInputAction,
  _obsecureText = obsecureText,
  _onSubmitted = onSubmitted
  ;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      keyboardType: _textInputType,
      textInputAction: _textInputAction,
      obscureText: _obsecureText,
      onSubmitted: _onSubmitted,
      decoration: InputDecoration(
        hintText: _hintText,
        prefixIcon: Icon(_iconData),
        enabledBorder: buildOutlineInputBorder(Color(0xFF54BAB9)),
        focusedBorder: buildOutlineInputBorder(Color(0xFF18978F)),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color, width: 1, style: BorderStyle.solid),
      );
  }
}
