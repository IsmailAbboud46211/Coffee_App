import 'package:coffe_app/app/home/data/coffee_tail_model.dart';
import 'package:coffe_app/app/home/view/coffe_tail_details.dart';
import 'package:coffe_app/app/home/view/home_ui.dart';
import 'package:coffe_app/app/on_bording/view/on_bording_screen.dart';
import 'package:coffe_app/app/profile/profile_ui.dart';
import 'package:coffe_app/core/router/route_name.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.onBoaring:
        return MaterialPageRoute(
          builder: (_) => const OnBordingScreen(),
        );

      case RoutesNames.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case RoutesNames.coffeeDetailsInfo:
        return MaterialPageRoute(
          builder: (_) => CoffeeTailDetails(
            coffeeTailModel: settings.arguments as CoffeeTailModel,
          ),
        );

      case RoutesNames.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileSecreen(),
        );
/*
      case RoutesNames.policies:
        return MaterialPageRoute(
          builder: (_) => const Policies(),
        );

      case RoutesNames.updateProfile:
        return MaterialPageRoute(
          builder: (_) => const UpdateProfile(),
        );

      case RoutesNames.search:
        return MaterialPageRoute(
          builder: (_) => const SearchProductScreen(),
        );

      case RoutesNames.faqs:
        return MaterialPageRoute(
          builder: (_) => const FAQS(),
        );

      case RoutesNames.contactUs:
        return MaterialPageRoute(
          builder: (_) => const ContactUs(),
        );*/
    }

    return null;
  }
}
