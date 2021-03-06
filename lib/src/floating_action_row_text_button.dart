import 'package:flutter/material.dart';

/// Creates a button for [FloatingActionRow]
class FloatingActionRowTextButton extends StatelessWidget {
  final Widget text;

  /// Background color
  final Color color;

  /// Width and height of this widget
  final double? size;
  final EdgeInsets padding;
  final ShapeBorder? shape;

  /// Foreground color for [text]
  final Color? foregroundColor;
  final GestureTapCallback onTap;

  FloatingActionRowTextButton({
    required this.text,
    this.color = Colors.transparent,
    this.size,
    this.padding = const EdgeInsets.all(0),
    this.shape,
    this.foregroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color? defaultColor =
        Theme.of(context).floatingActionButtonTheme.foregroundColor ??
            Theme.of(context).accentIconTheme.color;

    Widget result;

    result = LayoutBuilder(
      builder: (context, constraints) {
        bool isColumn = false;
        if (constraints.maxHeight > constraints.maxWidth) {
          isColumn = true;
        }
        double defaultSize =
            isColumn ? constraints.maxWidth : constraints.maxHeight;
        return SizedBox(
          width: size ?? defaultSize,
          height: size ?? defaultSize,
          child: Container(
            child: RawMaterialButton(
              elevation: 0,
              highlightElevation: 0,
              fillColor: color,
              padding: padding,
              shape: shape ??
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
              child: text,
              textStyle: TextStyle(color: foregroundColor ?? defaultColor,),
              onPressed: onTap,
            ),
          ),
        );
      },
    );

    return result;
  }
}
