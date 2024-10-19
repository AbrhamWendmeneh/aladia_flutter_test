import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final BorderRadius boarderRadius;
  final double? width;
  final BorderSide? borderSide;
  final Color? borderColor;
  final BoxDecoration? decoration;

  const CustomButton({
    super.key,
    required this.child,
    this.width,
    this.onPressed,
    this.color,
    this.elevation,
    this.padding,
    this.boarderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.borderSide,
    this.borderColor,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        minimumSize: Size(width ?? double.infinity, 48),
        padding: padding ?? const EdgeInsets.symmetric(vertical: 16.0),
        backgroundColor: color ?? appTheme.colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: boarderRadius,
          side: borderSide ??
              BorderSide(color: borderColor ?? Colors.transparent),
        ),
      ),
      child: child,
    );
  }
}
