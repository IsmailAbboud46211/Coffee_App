import 'package:coffe_app/core/extension/media_query.dart';
import 'package:coffe_app/core/extension/sized_box.dart';
import 'package:coffe_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomSpinkit extends StatelessWidget {
  const CustomSpinkit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (context.height / 5).ph,
        Center(
          child: SpinKitFadingCircle(
            color: AppColors.primaryColor,
            size: context.width * 0.15,
          ),
        )
      ],
    );
  }
}
