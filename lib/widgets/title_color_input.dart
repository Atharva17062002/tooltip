import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooltip_plotline/widgets/utils.dart';

class ColorTitleInput extends StatefulWidget {
  const ColorTitleInput(
      {super.key, required this.title, required this.textEditingController});

  final String title;
  final TextEditingController textEditingController;

  @override
  State<ColorTitleInput> createState() => _ColorTitleInputState();
}

class _ColorTitleInputState extends State<ColorTitleInput> {
  Color selectedColor = Colors.black;

  ColorPicker openColorPicker() {
    return ColorPicker(
        pickerColor: selectedColor,
        onColorChanged: (color) {
          setState(() {
            selectedColor = color;
            widget.textEditingController.text = colorToHex(color);
          });
        });
  }

  void _openColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (Color color) {
                setState(() {
                  selectedColor = color;
                  widget.textEditingController.text = colorToHex(color);
                });
              },
              // enableLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                readOnly: true,
                // initialValue: 'Choose Color',
                onTap: () {
                  _openColorPicker(context);
                },
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
  }
}
