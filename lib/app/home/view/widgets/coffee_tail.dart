import 'package:coffe_app/app/home/data/coffee_tail_model.dart';
import 'package:coffe_app/core/extension/media_query.dart';
import 'package:coffe_app/core/extension/routing_extenstion.dart';
import 'package:coffe_app/core/extension/sized_box.dart';
import 'package:coffe_app/core/global/custom_awesom_dialog.dart';
import 'package:coffe_app/core/router/route_name.dart';
import 'package:coffe_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class CoffeeTail extends StatelessWidget {
  final CoffeeTailModel coffeeTailModel;
  const CoffeeTail({super.key, required this.coffeeTailModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: context.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.deepBrown,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* coffee tail Image
              SizedBox(
                height: context.height * 0.25,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(coffeeTailModel.coffeeImagePath),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* Coffee Tail title
                    Text(
                      coffeeTailModel.coffeeTitle,
                      style: TextStyle(fontSize: context.width * 0.06, color: AppColors.primaryColor),
                    ),
                    //* Coffee Tail ditels
                    Text(
                      coffeeTailModel.coffeeDitels,
                      style: TextStyle(fontSize: context.width * 0.04, color: AppColors.softGrey),
                    ),
                    (context.width * 0.04).ph,
                    //* Coffee Tail Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$" "${coffeeTailModel.coffeePrice}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.softOrnage,
                          ),
                          child: GestureDetector(
                            onTap: () => customAwesomeDialog(
                              context: context,
                              title: 'you will buy this coffee',
                              message: "Are you sur you will buy this coffee",
                              width: context.width,
                              btnCancelText: "Cancel",
                              btnOkText: "OK",
                              okAction: () {},
                              cancelAction: () {},
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    ElevatedButton(
                      child: Text(
                        "Show details",
                        style: TextStyle(color: AppColors.softOrnage),
                      ),
                      onPressed: () => context.go(
                        routeName: RoutesNames.coffeeDetailsInfo,
                        arguments: coffeeTailModel,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
