import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooltip_plotline/widgets/utils.dart';

class SmallInputAndTitle extends StatelessWidget {
  const SmallInputAndTitle(
      {super.key, required this.title, required this.textEditingController});

  final String title;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.universalTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.9 / 2.2,
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
                keyboardType: TextInputType.number,
                controller: textEditingController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Input',
                  hintStyle: GoogleFonts.barlow(
                    color: Colors.black.withOpacity(0.25),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
