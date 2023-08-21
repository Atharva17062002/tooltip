import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tooltip_plotline/widgets/title_color_input.dart';
import 'package:tooltip_plotline/widgets/render_tooltip_button.dart';
import 'package:tooltip_plotline/widgets/small_title_input.dart';
import 'package:tooltip_plotline/widgets/utils.dart';

import '../widgets/custom_tooltip_options.dart';
import '../widgets/large_title_input.dart';
import 'button_screen.dart';

class ToolTipSettings extends StatefulWidget {
  const ToolTipSettings({super.key});

  @override
  State<ToolTipSettings> createState() => _ToolTipSettingsState();
}

class _ToolTipSettingsState extends State<ToolTipSettings> {
  String selectedButton = 'Button 1';
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textSize = TextEditingController();
  TextEditingController padding = TextEditingController();
  TextEditingController cornerRadius = TextEditingController();
  TextEditingController tooltipWidth = TextEditingController();
  TextEditingController arrWidth = TextEditingController();
  TextEditingController arrHeight = TextEditingController();
  TextEditingController bgcolor = TextEditingController();
  TextEditingController tColor = TextEditingController();
  var imageProvider;
  @override
  void dispose() {
    textEditingController.dispose();
    textSize.dispose();
    cornerRadius.dispose();
    padding.dispose();
    tooltipWidth.dispose();
    arrWidth.dispose();
    arrHeight.dispose();
    super.dispose();
  }

  late CustomToolTipOptions customToolTipOptions = CustomToolTipOptions(
    toolText: '',
    id: '',
    enabled: true,
    arrowHeight: 0,
    arrowWidth: 0,
    cornerRadius: 0,
    toolTipWidth: 0,
    padd: 0,
    textSize: 0,
    image: null,
  );

  void _handleInput() {
    if (textEditingController.text.isNotEmpty || imageProvider != null) {
      setState(() {
        customToolTipOptions.cornerRadius = double.tryParse(cornerRadius.text);
        customToolTipOptions.textSize = double.tryParse(textSize.text);
        customToolTipOptions.padd = double.tryParse(padding.text);
        customToolTipOptions.toolTipWidth = double.tryParse(tooltipWidth.text);
        customToolTipOptions.arrowWidth = double.tryParse(arrWidth.text);
        customToolTipOptions.arrowHeight = double.tryParse(arrHeight.text);
        customToolTipOptions.toolText = textEditingController.text;
        customToolTipOptions.textColor = colorFromHex(tColor.text);
        customToolTipOptions.bgColor = colorFromHex(bgcolor.text);
        customToolTipOptions.image = imageProvider;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ButtonScreen(
              selectedID: selectedButton,
              customToolTipOptions: customToolTipOptions,
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 40,
              left: 20,
              child: Text(
                'Target Element',
                style: TextStyles.universalTextStyle,
              ),
            ),
            Positioned(
              top: 70,
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(0.15000000596046448),
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 5, left: 10, right: 10),
                  child: DropdownButtonFormField<String>(
                    icon: const Icon(AntDesign.down),
                    value: selectedButton,
                    style: TextStyles.universalTextStyle,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        selectedButton = newValue!;
                      });
                    },
                    items: [
                      'Button 1',
                      'Button 2',
                      'Button 3',
                      'Button 4',
                      'Button 5'
                    ].map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: GoogleFonts.barlow(
                                textStyle:
                                    const TextStyle(color: Colors.black)),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 130,
              left: 20,
              child: LargeTitleInput(
                title: 'Tooltip text',
                textEditingController: textEditingController,
              ),
            ),
            Positioned(
              top: 210,
              left: 20,
              child: SmallInputAndTitle(
                title: 'Text Size',
                textEditingController: textSize,
              ),
            ),
            Positioned(
                top: 210,
                right: 20,
                child: SmallInputAndTitle(
                  title: 'Padding',
                  textEditingController: padding,
                )),
            Positioned(
                top: 290,
                left: 20,
                child: ColorTitleInput(
                  title: 'Text Color',
                  textEditingController: tColor,
                )),
            Positioned(
                top: 375,
                left: 20,
                child: ColorTitleInput(
                  title: 'Background colour',
                  textEditingController: bgcolor,
                )),
            Positioned(
                top: 460,
                left: 20,
                child: SmallInputAndTitle(
                  title: 'Corner Radius',
                  textEditingController: cornerRadius,
                )),
            Positioned(
                top: 460,
                right: 20,
                child: SmallInputAndTitle(
                  title: 'Tooltip width',
                  textEditingController: tooltipWidth,
                )),
            Positioned(
                top: 545,
                left: 20,
                child: SmallInputAndTitle(
                  title: 'Arrow width',
                  textEditingController: arrWidth,
                )),
            Positioned(
                top: 545,
                right: 20,
                child: SmallInputAndTitle(
                  title: 'Arrow height',
                  textEditingController: arrHeight,
                )),
            Positioned(
              top: 630, // Adjust the positioning as needed
              left: 20,
              child: SizedBox(
                height: 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Image Picker',
                      style: TextStyles.universalTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final pickedImage = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (pickedImage != null) {
                          imageProvider = FileImage(File(pickedImage.path));
                          final image = Image.file(File(pickedImage.path));
                          image.image
                              .resolve(const ImageConfiguration())
                              .addListener(
                            ImageStreamListener((ImageInfo info, bool _) {
                              final height = info.image.height;
                              setState(() {
                                customToolTipOptions.imageHeight =
                                    height.toDouble();
                              });
                            }),
                          );
                        }
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black
                                  .withOpacity(0.15000000596046448)),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        alignment: Alignment.center,
                        child: Text('Select Image',
                            style: GoogleFonts.barlow(
                                fontSize: 20,
                                color: Colors.black.withOpacity(0.25),
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              child: RenderToolTipButton(
                onPressed: () {
                  _handleInput();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
