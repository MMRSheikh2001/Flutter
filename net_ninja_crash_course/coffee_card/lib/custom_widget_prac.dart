import 'package:flutter/material.dart';

class StyleBodyText extends StatelessWidget {
  final String text;
  const StyleBodyText(this.text,{super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    );
  }
}


class StyledButton extends StatelessWidget {
  const StyledButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
