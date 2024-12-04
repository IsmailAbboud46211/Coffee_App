import 'package:coffe_app/core/extension/media_query.dart';
import 'package:coffe_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class CoffeType extends StatelessWidget {
  final String coffeeType;
  final bool isSelected;
  final VoidCallback onTap;
  const CoffeType({
    super.key,
    required this.coffeeType,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: context.width * 0.1),
        child: Column(
          children: [
            Text(
              coffeeType,
              style: TextStyle(
                color: isSelected ? AppColors.softOrnage : AppColors.lightGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Visibility(
                visible: isSelected,
                child: Icon(
                  Icons.circle_rounded,
                  color: AppColors.softOrnage,
                  size: 10,
                ))
          ],
        ),
      ),
    );
  }
}
