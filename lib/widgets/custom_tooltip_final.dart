import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class TrianglePainter extends CustomPainter {
  bool isDownArrow;
  Color color;

  TrianglePainter({this.isDownArrow = true, required this.color});

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

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CustomTooltip extends StatefulWidget {
  final ImageProvider? image;
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
  late double _imageHeight;
  late double _toolTipHeight;

  CustomTooltip({
    double? imageHeight,
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
    this.image,
    double? toolTipHeight,
  }) {
    _imageHeight = imageHeight ?? 100;
    _textColor = textColor ?? Colors.white;
    _bgColor = bgColor ?? const Color(0xff212121);
    _textSize = textSize ?? 16.0;
    _arrowWidth = arrowWidth ?? 10.0;
    _cornerRadius = cornerRadius ?? 1.68;
    _arrowHeight = arrowHeight ?? 10.0;
    _padding = padd ?? 3.35;
    _toolTipWidth = toolTipWidth ?? 170;
    _toolTipHeight = toolTipHeight ?? 50;
  }

  @override
  State<CustomTooltip> createState() => _CustomTooltipState();
}

class _CustomTooltipState extends State<CustomTooltip> {
  OverlayEntry? _overlayEntry;

  void _showTooltip(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final screenSize = MediaQuery.of(context).size;
    final tooltipHeight = widget._toolTipHeight;
    final double imageHeight = widget._imageHeight / 20;

    final double spaceBelow = screenSize.height -
        renderBox.localToGlobal(Offset.zero).dy -
        renderBox.size.height;

    final double spaceAbove = renderBox.localToGlobal(Offset.zero).dy;

    double dy;
    bool isTooltipBelow;

    if (spaceBelow >= tooltipHeight) {
      dy = renderBox.localToGlobal(Offset.zero).dy + renderBox.size.height;
      isTooltipBelow = true;
    } else if (spaceAbove >= tooltipHeight) {
      dy = renderBox.localToGlobal(Offset.zero).dy - tooltipHeight;
      isTooltipBelow = false;
    } else {
      dy = renderBox.localToGlobal(Offset.zero).dy + renderBox.size.height;
      isTooltipBelow = true;
    }

    final double childCenterX =
        renderBox.localToGlobal(Offset(renderBox.size.width / 2, 0)).dx;
    final double tooltipWidth = widget._toolTipWidth + widget._padding * 2;
    double dx = childCenterX - tooltipWidth / 2;
    if (dx < 0) {
      dx = 0;
    } else if (dx + tooltipWidth > screenSize.width) {
      dx = screenSize.width - tooltipWidth;
    }

    double triangleTop;
    double triangleRotation = 0.0;

    if (isTooltipBelow) {
      triangleTop = dy;
      triangleRotation = math.pi;
    } else {
      triangleTop = dy + 40 - widget._arrowHeight + 10;
    }

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Center(
          child: Stack(
            children: [
              isTooltipBelow
                  ? Positioned(
                      top: dy + widget._arrowHeight,
                      left: dx + 4,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Container(
                          width: widget._toolTipWidth,
                          padding: EdgeInsets.all(widget._padding),
                          decoration: BoxDecoration(
                            color: widget._bgColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(widget._cornerRadius)),
                          ),
                          child: Column(
                            children: [
                              Text(
                                widget.message,
                                style: GoogleFonts.barlow(
                                  textStyle: TextStyle(
                                    color: widget._textColor,
                                    fontSize: widget._textSize,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              widget.image != null
                                  ? Container(
                                      width: tooltipWidth,
                                      height: imageHeight,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: widget.image != null
                                          ? Image(
                                              image: widget.image!,
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                    )
                                  : Container(
                                      color: Colors.transparent,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Positioned(
                      bottom: MediaQuery.of(context).size.height - triangleTop,
                      left: dx + 4,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Container(
                          width: widget._toolTipWidth,
                          padding: EdgeInsets.all(widget._padding),
                          decoration: BoxDecoration(
                            color: widget._bgColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(widget._cornerRadius)),
                          ),
                          child: Column(
                            children: [
                              widget.image != null
                                  ? Container(
                                      width: tooltipWidth,
                                      height: imageHeight,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: widget.image != null
                                          ? Image(
                                              image: widget.image!,
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                    )
                                  : Container(
                                      color: Colors.transparent,
                                    ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.message,
                                style: GoogleFonts.barlow(
                                  textStyle: TextStyle(
                                    color: widget._textColor,
                                    fontSize: widget._textSize,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              Positioned(
                top: triangleTop,
                left:
                    dx + widget._toolTipWidth / 2 - widget._arrowWidth / 2 + 3,
                child: Transform.rotate(
                  angle: triangleRotation,
                  child: CustomPaint(
                    size: Size(widget._arrowWidth, widget._arrowHeight),
                    painter: TrianglePainter(
                        isDownArrow: true, color: widget._bgColor),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);

    Future.delayed(const Duration(seconds: 1), () {
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
