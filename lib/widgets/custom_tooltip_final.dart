import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrianglePainter extends CustomPainter {
  bool isDownArrow;
  Color color;

  TrianglePainter({this.isDownArrow = true, required this.color});

  /// Draws the triangle of specific [size] on [canvas]
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    paint.strokeWidth = 2.0;
    paint.color = color;
    paint.style = PaintingStyle.fill;

    if (isDownArrow) {
      path.moveTo(0.0, -1.0);
      path.lineTo(size.width, -1.0);
      path.lineTo(size.width / 2.0, size.height);
    } else {
      path.moveTo(size.width / 2.0, 0.0);
      path.lineTo(0.0, size.height + 1);
      path.lineTo(size.width, size.height + 1);
    }

    canvas.drawPath(path, paint);
  }

  /// Specifies to redraw for [customPainter]
  @override
  bool shouldRepaint(CustomPainter customPainter) {
    return true;
  }
}

// class MyApp1 extends StatelessWidget {
//   const MyApp1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             Positioned(
//               top: 330,
//               right: 200,
//               child: CustomTooltip(
//                 message: "Hello, this is a custom tooltip!",
//                 child: Container(
//                   child: Text('Click me'),
//                   padding: EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CustomTooltip extends StatefulWidget {
  final Widget child;
  final String message;
  String id;
  late Color _textColor;
  late Color _bgColor;
  late double _textSize;
  late double _padding;
  late double _cornerRadius;
  late double _toolTipWidth;
  late double _arrowWidth;
  late double _arrowHeight;

  CustomTooltip({
    super.key,
    double? cornerRadius,
    required this.id,
    Color? textColor,
    Color? bgColor,
    double? textSize,
    double? arrowHeight,
    double? toolTipWidth,
    double? padd,
    double? arrowWidth,
    required this.child,
    required this.message,
  }) {
    _textColor = textColor ?? Colors.white;
    _bgColor = bgColor ?? const Color(0xff212121);
    _textSize = textSize ?? 16.0;
    _arrowWidth = arrowWidth ?? 10.0;
    _cornerRadius = cornerRadius ?? 1.68;
    _arrowHeight = arrowHeight ?? 10.0;
    _padding = padd ?? 3.35;
    _toolTipWidth = toolTipWidth ?? 100;
  }

  @override
  State<CustomTooltip> createState() => _CustomTooltipState();
}

class _CustomTooltipState extends State<CustomTooltip> {
  OverlayEntry? _overlayEntry;

  void _showTooltip(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final screenSize = MediaQuery.of(context).size;
    const tooltipHeight = 40.0;

    // Calculate available space on the horizontal and vertical sides
    final double spaceBelow = screenSize.height -
        renderBox.localToGlobal(Offset.zero).dy -
        renderBox.size.height;

    final double spaceAbove = renderBox.localToGlobal(Offset.zero).dy;
    final double spaceRight = screenSize.width -
        renderBox.localToGlobal(Offset.zero).dx -
        renderBox.size.width;
    final double spaceLeft = renderBox.localToGlobal(Offset.zero).dx;

    double dx = spaceLeft +
        renderBox.size.width / 2.0 -
        (widget.message.length * 0) / 2.0;
    if (dx < 10.0) {
      dx = 10.0;
    }
    if (spaceLeft - widget.message.length * 2 > 15) {
      dx = spaceLeft - widget.message.length * 3.5 - 15;
    }
    if (spaceRight - widget.message.length * 2 > 15) {
      dx = spaceLeft + 15;
    }

    double dy = spaceAbove - 20;
    if (dy <= MediaQuery.of(context).padding.top + 10) {
      // not enough space above, show popup under the widget.
      dy = 15 + renderBox.size.height + spaceAbove;
    } else {
      dy -= 15;
    }
    // Determine the best position for the tooltip based on available space
    if (spaceBelow >= tooltipHeight && spaceAbove < spaceBelow) {
      // Display the tooltip below the widget
    } else if (spaceAbove >= tooltipHeight && spaceBelow < spaceAbove) {
      // Display the tooltip above the widget
    } else {
      // Display the tooltip just above the widget when it's in the extreme right
    }

    // Create overlay entry for the tooltip
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              top: dy,
              left: dx,
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  width: widget._toolTipWidth,
                  padding: EdgeInsets.all(widget._padding),
                  decoration: BoxDecoration(
                    color: widget._bgColor,
                    borderRadius:
                        BorderRadius.all(Radius.circular(widget._cornerRadius)),
                  ),
                  child: Text(widget.message,
                      style: GoogleFonts.barlow(
                          textStyle: TextStyle(
                        color: widget._textColor,
                        fontSize: widget._textSize,
                      ))),
                ),
              ),
            ),
            Positioned(
              top: widget._padding,
              left: widget._toolTipWidth / 2 - widget._arrowWidth / 2,
              child: CustomPaint(
                size: Size(widget._arrowWidth, widget._arrowHeight),
                painter:
                    TrianglePainter(isDownArrow: true, color: widget._bgColor),
              ),
            ),
          ],
        );
      },
    );

    // Insert overlay entry
    Overlay.of(context).insert(_overlayEntry!);

    // Schedule the removal of the tooltip after 1 second
    Future.delayed(const Duration(seconds: 2), () {
      _hideTooltip();
    });
  }

  void _hideTooltip() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _showTooltip(context);
      },
      child: widget.child,
    );
  }
}
