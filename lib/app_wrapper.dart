import 'package:coffe_app/app/home/view/home_ui.dart';
import 'package:coffe_app/app/on_bording/view/on_bording_screen.dart';
import 'package:coffe_app/app/start/cubit/start_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  @override
  Widget build(BuildContext context) {
    //* To kepp Device orientation portraitUp
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return BlocBuilder<StartAppCubit, StartAppState>(
      builder: (context, state) {
        if (state is SkiepedOnBording) {
          //* when connect with api
          //  return const HomeScreen();
          return const OnBordingScreen();
        }
        return const OnBordingScreen();
      },
    );
  }
}
