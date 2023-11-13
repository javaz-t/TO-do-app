import 'package:flutter/material.dart';
import 'package:to_dos/widgets/my_button.dart';

// ignore: must_be_immutable
class DialogueBox extends StatelessWidget {
  VoidCallback onCancel;
  VoidCallback onSave;
  final copyText;

  String? validateEmptyField(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a value';
  }
  return null;
}


  DialogueBox({
    super.key,
    required this.onSave,
    required this.onCancel,
    required this.copyText
  });    

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 231, 148, 231),
      content: Container(
        height: 120,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               TextField(
                controller: copyText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  
                  hintText: "Add a new task ",
                ),
            
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, //right side
        
                children: [
                  MyButton(text: "save", onEvent: onSave),
                  SizedBox(
                    width: 10,
                  ),
                  MyButton(text: "cancel", onEvent: onCancel)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
