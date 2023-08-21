import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RenderToolTipButton extends StatelessWidget {
  const RenderToolTipButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 60,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color(0xFF0958D9),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          'Render Tooltip',
          style: GoogleFonts.barlow(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
