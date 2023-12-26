import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  final String title;
  final Function() onTap;
  const ButtonContainer({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: const BorderRadius.all(
            Radius.circular(18.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(0, 6.0),
              blurRadius: 22.0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
