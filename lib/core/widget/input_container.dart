import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const InputContainer(
      {super.key, required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.white, fontSize: 18.0),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white, fontSize: 18.0)),
      ),
    );
  }
}
