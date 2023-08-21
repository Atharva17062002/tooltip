import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    // required this.globalKey,
  });

  final String text;
  final VoidCallback onPressed;
  // final GlobalKey globalKey;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // key: widget.globalKey,
      onTap: () {
        widget.onPressed;
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(5),
        ),
        width: 100,
        height: 40,
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
