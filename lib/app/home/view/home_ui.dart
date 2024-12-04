import 'package:coffe_app/app/home/data/coffee_tail_model.dart';
import 'package:coffe_app/app/home/view/widgets/coffee_tail.dart';
import 'package:coffe_app/app/home/view/widgets/coffee_type.dart';
import 'package:coffe_app/core/extension/media_query.dart';
import 'package:coffe_app/core/extension/routing_extenstion.dart';
import 'package:coffe_app/core/extension/sized_box.dart';
import 'package:coffe_app/core/global/custom_text_field.dart';
import 'package:coffe_app/core/router/route_name.dart';
import 'package:coffe_app/core/themes/app_color.dart';
import 'package:coffe_app/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchEditingController = TextEditingController();
  final List coffeeTypes = [
    //*[coffee type , isSelected]
    [
      "Cappucino",
      true,
    ],
    [
      "Latte",
      false,
    ],
    [
      "Black",
      false,
    ],
    [
      "Tea",
      false,
    ],
  ];
  void coffeeTypeSelected({required int index}) {
    setState(() {
      for (int i = 0; i < coffeeTypes.length; i++) {
        coffeeTypes[i][1] = false;
      }
      coffeeTypes[index][1] = true;
    });
  }

  final List<CoffeeTailModel> coffeetails = [
    CoffeeTailModel(
      coffeeImagePath: Images.firstImage,
      coffeeTitle: "Latte",
      coffeeDitels: "Greate Latte coffee with milk",
      coffeePrice: 44,
      coffeRate: 4,
    ),
    CoffeeTailModel(
      coffeeImagePath: Images.secondImage,
      coffeeTitle: "Cappucino",
      coffeeDitels: "Greate Cappucino  with milk",
      coffeePrice: 60,
      coffeRate: 3,
    ),
    CoffeeTailModel(
      coffeeImagePath: Images.thirdImage,
      coffeeTitle: "Black coffee",
      coffeeDitels: "Greate Black coffee coffee with milk",
      coffeePrice: 70,
      coffeRate: 5,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            //*Drawer
            leading: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.09,
                vertical: context.width * 0.05,
              ),
              child: GestureDetector(child: const FaIcon(FontAwesomeIcons.list)),
            ),
            actions: [
              //* Profile page
              IconButton(
                  onPressed: () => context.go(routeName: RoutesNames.profile),
                  icon: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.width * 0.09,
                      vertical: context.width * 0.05,
                    ),
                    child: const FaIcon(FontAwesomeIcons.faceLaugh),
                  ))
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* main text
                Text("Find the best coffee for you",
                    style: GoogleFonts.aboreto(
                      fontWeight: FontWeight.bold,
                      fontSize: context.width * 0.09,
                      color: AppColors.secondryColor,
                    )),
                (context.height * 0.05).ph,
                //*search field
                CustomTextFormField(
                  controller: searchEditingController,
                  labelText: "Find your coffe..",
                  hintText: "Find your coffe..",
                  textInputText: TextInputType.name,
                  prefixIcon: const Icon(Icons.search),
                ),
                (context.height * 0.05).ph,
                //* Coffee types
                SizedBox(
                  height: context.height * 0.06,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: coffeeTypes.length,
                    itemBuilder: (context, index) => CoffeType(
                      coffeeType: coffeeTypes[index][0],
                      isSelected: coffeeTypes[index][1],
                      onTap: () {
                        coffeeTypeSelected(index: index);
                      },
                    ),
                  ),
                ),
                //* Coffee tails
                Expanded(
                    child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeetails.length,
                  itemBuilder: (context, index) => CoffeeTail(
                    coffeeTailModel: coffeetails[index],
                  ),
                ))
              ],
            ),
          )),
    );
  }
}
