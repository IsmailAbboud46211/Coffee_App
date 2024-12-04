import 'package:coffe_app/core/extension/media_query.dart';
import 'package:coffe_app/core/extension/sized_box.dart';
import 'package:coffe_app/core/themes/app_color.dart';
import 'package:coffe_app/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileSecreen extends StatelessWidget {
  const ProfileSecreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepBrown,
      body: Column(
        children: [
          //* Image
          Container(
            height: context.height / 2,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: Image.asset(Images.userBackground).image,
                  fit: BoxFit.fill,
                )),
            // child: Image.asset(widget.coffeeTailModel.coffeeImagePath),
          ),
          (context.width / 5).ph,
          //* Contact us
          Text(
            "Contatc Us",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: context.width / 20,
            ),
          ),
          (context.width / 15).ph,
          //* text
          Text(
            "You can find me at those sites",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: context.width / 25,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () async {
                  final url = Uri.parse('https://www.instagram.com/ismailabboud0');
                  if (await canLaunchUrl(url)) {
                    launchUrl(url);
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                      "Sorry , There is an issue , Check your internet connection",
                    )));
                  }
                },
                icon: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: AppColors.softGrey,
                ),
              ),
              IconButton(
                onPressed: () async {
                  String? encodeQueryParameters(Map<String, String> params) {
                    return params.entries
                        .map((MapEntry<String, String> e) =>
                            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                        .join('&');
                  }

                  final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: 'ismailtodoapp@gmail.com',
                    query: encodeQueryParameters(
                      <String, String>{
                        'subject': 'Hello from Coffee app',
                        'body': "I'am using the app and it's very Good !"
                      },
                    ),
                  );
                  if (await canLaunchUrl(emailUri)) {
                    launchUrl(emailUri);
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                      "Sorry , There is an issue , Check your internet connection",
                    )));
                  }
                },
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  color: AppColors.softGrey,
                ),
              )
            ],
          ),

          Text(
            "Coffee app v 0.1",
            style: GoogleFonts.indieFlower(
              fontWeight: FontWeight.bold,
              color: AppColors.lightGrey,
            ),
          )
        ],
      ),
    );
  }
}
