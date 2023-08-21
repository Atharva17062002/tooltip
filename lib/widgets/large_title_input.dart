import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooltip_plotline/widgets/utils.dart';

class LargeTitleInput extends StatefulWidget {
  const LargeTitleInput(
      {super.key, required this.title, required this.textEditingController});

  final String title;
  final TextEditingController textEditingController;

  @override
  State<LargeTitleInput> createState() => _LargeTitleInputState();
}

class _LargeTitleInputState extends State<LargeTitleInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyles.universalTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black.withOpacity(0.15000000596046448)),
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                style: TextStyles.universalTextStyle,
                controller: widget.textEditingController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Input',
                    hintStyle: GoogleFonts.barlow(
                        color: Colors.black.withOpacity(0.25),
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
