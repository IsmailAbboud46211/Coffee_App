import 'package:coffe_app/app/home/data/coffee_tail_model.dart';
import 'package:coffe_app/app/home/view/widgets/size_button.dart';
import 'package:coffe_app/core/extension/media_query.dart';
import 'package:coffe_app/core/extension/sized_box.dart';
import 'package:coffe_app/core/global/custom_awesom_dialog.dart';
import 'package:coffe_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CoffeeTailDetails extends StatefulWidget {
  final CoffeeTailModel coffeeTailModel;
  const CoffeeTailDetails({super.key, required this.coffeeTailModel});

  @override
  State<CoffeeTailDetails> createState() => _CoffeeTailDetailsState();
}

class _CoffeeTailDetailsState extends State<CoffeeTailDetails> {
  List sizes = [
    ["S", true],
    ["M", false],
    ["L", false],
  ];
  void coffeeSizeSelected({required int index}) {
    setState(() {
      for (int i = 0; i < sizes.length; i++) {
        sizes[i][1] = false;
      }
      sizes[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepBrown,
      body: Column(
        children: [
          //* Coffe Image
          Container(
            height: context.height / 2,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: Image.asset(widget.coffeeTailModel.coffeeImagePath).image,
                  fit: BoxFit.fill,
                )),
            // child: Image.asset(widget.coffeeTailModel.coffeeImagePath),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.09),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* Coffe title
                    Text(
                      widget.coffeeTailModel.coffeeTitle,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: context.width * 0.06,
                      ),
                    ),
                    //* Coffe detiles
                    Text(
                      widget.coffeeTailModel.coffeeDitels,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    (context.width * 0.06).ph,
                    Row(
                      children: [
                        //* Coffe Rate
                        Icon(
                          Icons.star,
                          color: AppColors.yellow,
                        ),
                        (context.width * 0.01).pw,
                        Text(widget.coffeeTailModel.coffeRate.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: context.width * 0.05,
                            )),
                        const Spacer(),
                        //* Coffe consept
                        Container(
                          width: context.width / 6,
                          height: context.height / 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors.secondryColor,
                          ),
                          child: const Center(
                              child: FaIcon(
                            // ignore: deprecated_member_use
                            FontAwesomeIcons.coffee,
                            color: Colors.white,
                          )),
                        ),
                        (context.width * 0.01).pw,
                        Container(
                          width: context.width / 6,
                          height: context.height / 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors.secondryColor,
                          ),
                          child: const Center(
                              child: FaIcon(
                            // ignore: deprecated_member_use
                            FontAwesomeIcons.plantWilt,
                            color: Colors.white,
                          )),
                        ),
                      ],
                    ),
                    const Text(
                      "Size",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    (context.width * 0.06).ph,

                    ///* Sizes buttons
                    SizedBox(
                      width: double.infinity,
                      height: context.height / 20,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => (context.width * 0.06).pw,
                        scrollDirection: Axis.horizontal,
                        itemCount: sizes.length,
                        itemBuilder: (context, index) => SizeButton(
                          onPressed: () {
                            coffeeSizeSelected(index: index);
                          },
                          size: sizes[index][0],
                          isSelected: sizes[index][1],
                        ),
                      ),
                    ),
                    (context.width / 6).ph,
                    Row(
                      children: [
                        //* Price
                        Column(
                          children: [
                            const Text("Price",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                            (context.width * 0.06).ph,
                            Text(
                              "\$${widget.coffeeTailModel.coffeePrice}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: context.width * 0.05,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () => customAwesomeDialog(
                            context: context,
                            title: 'you will buy this coffee',
                            message: "Are you sur you will buy this coffee",
                            width: context.width,
                            btnCancelText: "Cancel",
                            btnOkText: "OK",
                            okAction: () {},
                            cancelAction: () {},
                          ),
                          style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                AppColors.softOrnage,
                              ),
                              textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 20))),
                          child: const Text(
                            "Buy Now",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
