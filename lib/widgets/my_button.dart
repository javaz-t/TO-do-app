import 'package:flutter/material.dart';
// ignore: must_be_immutable
class MyButton extends StatelessWidget {
 final String text;
  VoidCallback onEvent;

   MyButton({
    super.key,
    required this.text,
    required this.onEvent,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:onEvent,
      color: Color.fromARGB(255, 54, 113, 143),
      child: Text(text,
      style: TextStyle(color: Color.fromARGB(255, 197, 231, 139)),),
    );
  }
}
