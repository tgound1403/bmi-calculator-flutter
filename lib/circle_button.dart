import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function update;
  CircleButton({this.icon, this.update});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      onPressed: update,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      child: Icon(icon, color: Colors.white),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
