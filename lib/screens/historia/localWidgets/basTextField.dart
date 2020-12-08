import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  Function onSubmitted;

  BasTextField({this.labelText, this.controller, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
      child: TextField(
        onSubmitted: onSubmitted,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'Ubuntu',
          ),
        ),
      ),
    );
  }
}
