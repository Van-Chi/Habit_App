import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:habit_app/app/pages/introduction/introduction_controller.dart';
import 'package:habit_app/app/pages/login/login_page.dart';
import 'package:habit_app/app/widgets/app_button.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class IntroductionPage extends StatelessWidget {
  IntroductionPage({super.key});

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              Selector<IntroductionController, List<Widget>>(
                selector: (BuildContext context, state) {
                  state.loadData();
                  return state.imageList;
                },
                builder:
                    (BuildContext context, List<Widget> value, Widget? widget) {
                  return SizedBox(
                    height: 580,
                    child: PageView(
                      controller: controller,
                      children: value,
                      onPageChanged: (index) {
                        context.read<IntroductionController>().setIndex(index);
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                width: 350,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'WE CAN ',
                        style: TextStyle(
                          color: Color(0xff573353),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      TextSpan(
                        text: 'HELP YOU ',
                        style: TextStyle(
                          color: Color(0xffFC9D45),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      TextSpan(
                        text: 'TO BE A BETTER VERSION OF ',
                        style: TextStyle(
                          color: Color(0xff573353),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      TextSpan(
                        text: 'YOURSELF',
                        style: TextStyle(
                          color: Color(0xffFC9D45),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Selector<IntroductionController, int>(
                  selector: (_, state) {
                    return state.index;
                  },
                  builder: (context, value, widget) {
                    return (value != 3)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    context
                                        .read<IntroductionController>()
                                        .setIndex(3);
                                    controller.jumpToPage(3);
                                  },
                                  child: const Text(
                                    'Skip',
                                    style: TextStyle(
                                      color: Color(0xff573353),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  )),
                              Selector<IntroductionController,
                                  (int, List<Widget>)>(
                                selector: (BuildContext context, state) {
                                  state.loadData();
                                  return (state.index, state.imageList);
                                },
                                builder: (BuildContext context, value,
                                    Widget? widget) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: value.$2
                                        .mapIndexed((e, index) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2),
                                              child: (e == value.$1)
                                                  ? SizedBox(
                                                      height: 17,
                                                      width: 17,
                                                      child: IconButton(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
                                                        onPressed: () {
                                                          context
                                                              .read<
                                                                  IntroductionController>()
                                                              .setIndex(e);
                                                          controller
                                                              .jumpToPage(e);
                                                        },
                                                        icon: const Icon(
                                                            Icons.circle,
                                                            color: Color(
                                                                0xffF9B566),
                                                            size: 17),
                                                      ),
                                                    )
                                                  : SizedBox(
                                                      height: 17,
                                                      width: 17,
                                                      child: IconButton(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
                                                        onPressed: () {
                                                          context
                                                              .read<
                                                                  IntroductionController>()
                                                              .setIndex(e);
                                                          controller
                                                              .jumpToPage(e);
                                                        },
                                                        icon: const Icon(
                                                            Icons.circle,
                                                            color: Color(
                                                                0xff573353),
                                                            size: 17),
                                                      ),
                                                    ),
                                            ))
                                        .toList(),
                                  );
                                },
                              ),
                              Selector<IntroductionController, int>(
                                selector: (_, state) {
                                  return state.index;
                                },
                                builder: (context, value, widget) {
                                  return TextButton(
                                      onPressed: () {
                                        if (value < 3) {
                                          context
                                              .read<IntroductionController>()
                                              .setIndex(value + 1);
                                          controller.jumpToPage(value + 1);
                                        }
                                      },
                                      child: const Text(
                                        'Next',
                                        style: TextStyle(
                                          color: Color(0xff573353),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ));
                                },
                              ),
                            ],
                          )
                        : SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: AppButton(
                              content: const Text(
                                'Get Started',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              backgroundColor: const Color(0xffFDA758),
                              foregroundColor: const Color(0xff573353),
                              onPress: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              },
                            ),
                          );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
