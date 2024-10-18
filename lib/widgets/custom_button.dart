import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final BorderRadius boarderRadius;
  final double? width;
  final BorderSide? borderSide; // Add this property for border
  final Color? borderColor; // Add this property for border color

  const CustomButton({
    super.key,
    required this.child,
    this.width,
    this.onPressed,
    this.color,
    this.elevation,
    this.padding,
    this.boarderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.borderSide, // Initialize the borderSide property
    this.borderColor, // Initialize the borderColor property
  });

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        minimumSize: Size(width ?? double.infinity, 48),
        padding: padding ?? const EdgeInsets.symmetric(vertical: 16.0),
        backgroundColor:
            color ?? appTheme.colorScheme.secondary, // Set the background color
        shape: RoundedRectangleBorder(
          borderRadius: boarderRadius,
          side: borderSide ??
              BorderSide(
                  color: borderColor ??
                      Colors.transparent), // Use borderColor if provided
        ),
      ),
      child: child,
    );
  }
}
