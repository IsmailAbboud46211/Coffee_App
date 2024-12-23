import 'package:coffe_app/app/on_bording/model/on_bording_model.dart';
import 'package:coffe_app/app/on_bording/view/widget/on_bording_item.dart';
import 'package:coffe_app/core/database/boxes_names.dart';
import 'package:coffe_app/core/database/keys_names.dart';
import 'package:coffe_app/core/extension/media_query.dart';
import 'package:coffe_app/core/extension/routing_extenstion.dart';
import 'package:coffe_app/core/extension/sized_box.dart';
import 'package:coffe_app/core/router/route_name.dart';
import 'package:coffe_app/core/themes/app_color.dart';
import 'package:coffe_app/core/utils/images.dart';
import 'package:coffe_app/main.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/enum/boxes_type.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  bool isLastPage = false;

  List<BoardModel> boardList = [
    BoardModel(
        imageUrl: Images.firstOnBordingImage,
        title: 'Welcome to best coffe app',
        descreption: 'Here you will find best coffe. '),
    BoardModel(
        imageUrl: Images.secondOnBordingImage,
        title: 'with your family',
        descreption: 'Order coffe  home easily way. '),
    BoardModel(
        imageUrl: Images.thirdOnBordingImage,
        title: 'Enjoy your time',
        descreption: 'We wish you a pleasant journey within the app.')
  ];
  var boardController = PageController();

  void _submit({required BuildContext context}) {
    hiveDB
        .putData(
          boxName: BoxesNames.settings,
          key: KeysNames.skipOnBording,
          value: true,
          boxType: BoxType.BOOLEAN,
        )
        .then(
          (value) => context.go(
            routeName: RoutesNames.home,
            replacement: true,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(Images.firstOnBordingImage), context);
    precacheImage(const AssetImage(Images.secondOnBordingImage), context);
    precacheImage(const AssetImage(Images.thirdOnBordingImage), context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => _submit(context: context),
            child: Text(
              "skip",
              style: TextStyle(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(context.width * 0.09),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                onPageChanged: (value) {
                  if (value == boardList.length - 1) {
                    setState(() {
                      isLastPage = true;
                    });
                  } else {
                    setState(() {
                      isLastPage = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => OnBordingSingleScreen(boardModel: boardList[index]),
                itemCount: boardList.length,
              ),
            ),
            (context.height * 0.005).ph,
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: ExpandingDotsEffect(
                    dotColor: AppColors.grey,
                    activeDotColor: AppColors.primaryColor,
                    dotHeight: context.height * 0.015,
                    expansionFactor: 4,
                    dotWidth: context.width * 0.03,
                    spacing: context.width * 0.025,
                  ),
                  count: boardList.length,
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLastPage) {
                      _submit(context: context);
                    } else {
                      boardController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
