import 'package:flutter/material.dart';

class AppElevatedBtn extends StatelessWidget {
  final BuildContext _context;
  final String _label;
  final void Function()? _onPressed;
  const AppElevatedBtn({
    super.key,
    required BuildContext context,
    required String label,
    required void Function()? onPressed,
  }):
        _context = context,
        _label = label,
        _onPressed = onPressed
  ;

  @override
  Widget build(_context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
        gradient: LinearGradient(
          colors: [Color(0xFF54BAB9), Color(0xFF18978F),],
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
    ),

      ),
      child: ElevatedButton(
        onPressed: _onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          minimumSize: Size(double.infinity, 45),
        ),
        child: Text(_label),
      ),
    );
  }
}


