import 'package:flutter/material.dart';

class RichTextPrac extends StatelessWidget {
  const RichTextPrac({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rich Text Practice", style: TextStyle(color: Colors.red)),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: RichText(
          softWrap: true,
          text: TextSpan(
            text:
                "Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.Hello, this is my rich text practice. I am practicing in class.",
          ),
        ),
      ),
      backgroundColor: Colors.black12,
    );
  }
}
