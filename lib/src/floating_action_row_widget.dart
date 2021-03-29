import 'package:flutter/material.dart';

/// Creates a button for [FloatingActionRow]
class FloatingActionRowWidgetButton extends StatelessWidget {
  final Widget widget;

  /// Background color
  final Color color;

  /// Width and height of this widget
  final double? size;
  final EdgeInsets padding;
  final ShapeBorder? shape;

  /// Foreground color for [text]
  final Color? foregroundColor;
  final GestureTapCallback onTap;

  FloatingActionRowWidgetButton({
    required this.widget,
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
            child: widget,
          ),
        );
      },
    );

    return result;
  }
}
