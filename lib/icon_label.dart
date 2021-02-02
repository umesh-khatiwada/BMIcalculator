import 'package:flutter/material.dart';
class LabelUp extends StatelessWidget {
LabelUp({@required this.label});
final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF8D8E98),
            fontSize: 18.00));
  }
}

class IconContent extends StatelessWidget {
IconContent({@required this.icon});
final IconData icon;



  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Color(0xFFFFFFFF),
      size: 100.10,
    );
  }
}