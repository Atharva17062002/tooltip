import 'package:flutter/material.dart';
import 'package:tooltip_plotline/widgets/custom_tooltip_final.dart';
import 'package:tooltip_plotline/widgets/custom_tooltip_options.dart';

import '../widgets/button.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({
    super.key,
    required this.customToolTipOptions,
    required this.selectedID,
  });

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
  final CustomToolTipOptions customToolTipOptions;
  final String selectedID;
}

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff868686),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: 15,
              left: 15,
              child: (widget.selectedID == 'Button 1')
                  ? CustomTooltip(
                      cornerRadius: widget.customToolTipOptions.cornerRadius,
                      textSize: widget.customToolTipOptions.textSize,
                      message: widget.customToolTipOptions.toolText,
                      arrowHeight: widget.customToolTipOptions.arrowHeight,
                      arrowWidth: widget.customToolTipOptions.arrowWidth,
                      toolTipWidth: widget.customToolTipOptions.toolTipWidth,
                      padd: widget.customToolTipOptions.padd,
                      textColor: widget.customToolTipOptions.textColor,
                      bgColor: widget.customToolTipOptions.bgColor,
                      image: widget.customToolTipOptions.image,
                      imageHeight: widget.customToolTipOptions.imageHeight,
                      id: '',
                      child: Button(
                        text: 'Button 1',
                        onPressed: () {},
                      ),
                    )
                  : Button(
                      text: 'Button 1',
                      onPressed: () {},
                    ),
            ),
            Positioned(
                top: 15,
                right: 15,
                child: (widget.selectedID == 'Button 2')
                    ? CustomTooltip(
                        cornerRadius: widget.customToolTipOptions.cornerRadius,
                        textSize: widget.customToolTipOptions.textSize,
                        message: widget.customToolTipOptions.toolText,
                        arrowHeight: widget.customToolTipOptions.arrowHeight,
                        arrowWidth: widget.customToolTipOptions.arrowWidth,
                        toolTipWidth: widget.customToolTipOptions.toolTipWidth,
                        padd: widget.customToolTipOptions.padd,
                        textColor: widget.customToolTipOptions.textColor,
                        bgColor: widget.customToolTipOptions.bgColor,
                        image: widget.customToolTipOptions.image,
                        imageHeight: widget.customToolTipOptions.imageHeight,
                        id: '',
                        child: Button(
                          text: 'Button 2',
                          onPressed: () {},
                        ),
                      )
                    : Button(
                        text: 'Button 2',
                        onPressed: () {},
                      )),
            Positioned(
              bottom: 60,
              left: 15,
              child: (widget.selectedID == 'Button 3')
                  ? CustomTooltip(
                      cornerRadius: widget.customToolTipOptions.cornerRadius,
                      textSize: widget.customToolTipOptions.textSize,
                      message: widget.customToolTipOptions.toolText,
                      arrowHeight: widget.customToolTipOptions.arrowHeight,
                      arrowWidth: widget.customToolTipOptions.arrowWidth,
                      toolTipWidth: widget.customToolTipOptions.toolTipWidth,
                      padd: widget.customToolTipOptions.padd,
                      textColor: widget.customToolTipOptions.textColor,
                      bgColor: widget.customToolTipOptions.bgColor,
                      image: widget.customToolTipOptions.image,
                      imageHeight: widget.customToolTipOptions.imageHeight,
                      id: '',
                      child: Button(
                        text: 'Button 3',
                        onPressed: () {},
                      ),
                    )
                  : Button(
                      text: 'Button 3',
                      onPressed: () {},
                    ),
            ),
            Positioned(
              bottom: 15,
              left: 15,
              child: (widget.selectedID == 'Button 4')
                  ? CustomTooltip(
                      cornerRadius: widget.customToolTipOptions.cornerRadius,
                      textSize: widget.customToolTipOptions.textSize,
                      message: widget.customToolTipOptions.toolText,
                      arrowHeight: widget.customToolTipOptions.arrowHeight,
                      arrowWidth: widget.customToolTipOptions.arrowWidth,
                      toolTipWidth: widget.customToolTipOptions.toolTipWidth,
                      padd: widget.customToolTipOptions.padd,
                      textColor: widget.customToolTipOptions.textColor,
                      bgColor: widget.customToolTipOptions.bgColor,
                      image: widget.customToolTipOptions.image,
                      imageHeight: widget.customToolTipOptions.imageHeight,
                      id: '',
                      child: Button(
                        text: 'Button 4',
                        onPressed: () {},
                      ),
                    )
                  : Button(
                      text: 'Button 4',
                      onPressed: () {},
                    ),
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: (widget.selectedID == 'Button 5')
                  ? CustomTooltip(
                      cornerRadius: widget.customToolTipOptions.cornerRadius,
                      textSize: widget.customToolTipOptions.textSize,
                      message: widget.customToolTipOptions.toolText,
                      arrowHeight: widget.customToolTipOptions.arrowHeight,
                      arrowWidth: widget.customToolTipOptions.arrowWidth,
                      toolTipWidth: widget.customToolTipOptions.toolTipWidth,
                      padd: widget.customToolTipOptions.padd,
                      textColor: widget.customToolTipOptions.textColor,
                      bgColor: widget.customToolTipOptions.bgColor,
                      image: widget.customToolTipOptions.image,
                      imageHeight: widget.customToolTipOptions.imageHeight,
                      id: '',
                      child: Button(
                        text: 'Button 5',
                        onPressed: () {},
                      ),
                    )
                  : Button(
                      text: 'Button 5',
                      onPressed: () {},
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
