import 'package:coffe_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class SizeButton extends StatelessWidget {
  final Function()? onPressed;
  final bool isSelected;
  final String size;
  const SizeButton({
    super.key,
    this.onPressed,
    required this.size,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            isSelected ? AppColors.secondryColor : AppColors.softWhite,
          ),
          textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 15))),
      child: Text(size),
    );
  }
}
