import 'package:flutter/material.dart';

class AppConfirmTextField extends StatelessWidget {
  final TextEditingController _textEditingController;
  final String _hintText;
  // final IconData _iconData;
  final TextInputType _textInputType;
  final TextInputAction _textInputAction;
  final bool _obsecureText;
  final void Function(String value)? _onSubmitted;

  final void Function(String value)? _onChanged;
  final FocusNode _focusNode;

  const AppConfirmTextField({
    super.key,
    required TextEditingController textEditingController,
    required String hintText,
    // required IconData iconData,
    TextInputType textInputType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.next,
    bool obsecureText = false,
    void Function(String value)? onSubmitted,

    void Function(String value)? onChanged,
    required FocusNode focusNode,

  }):
  _textEditingController = textEditingController,
  _hintText = hintText,
  // _iconData = iconData,
  _textInputType = textInputType,
  _textInputAction = textInputAction,
  _obsecureText = obsecureText,
  _onSubmitted = onSubmitted,

  _onChanged = onChanged,
  _focusNode = focusNode
  ;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: _textEditingController,
        keyboardType: _textInputType,
        textInputAction: _textInputAction,
        // obscureText: _obsecureText,
        onSubmitted: _onSubmitted,

        maxLength: 1,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
        onChanged: _onChanged,
        focusNode: _focusNode,

        decoration: InputDecoration(
          // hintText: _hintText,
          // prefixIcon: Icon(_iconData),
          enabledBorder: buildOutlineInputBorder(Color(0xFF54BAB9)),
          focusedBorder: buildOutlineInputBorder(Color(0xFF18978F)),

          counterText: '',
        ),
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
