import 'package:flutter/material.dart';
import 'package:habit_app/app/pages/introduction/component/item_page_view.dart';

class IntroductionController extends ChangeNotifier {
  List<Widget> imageList = [];
  int index = 0;

  void loadData() {
    // await Future.delayed(const Duration(seconds: 1));
    imageList = [
      ItemPageView(
          title: 'WELCOME TO MONUMENTAL HABITS',
          image: Image.asset('assets/images/pasted_image.png')),
      ItemPageView(
          title: 'CREATE NEW HABIT EASILY',
          image: Image.asset('assets/images/habits.png')),
      ItemPageView(
          title: 'KEEP TRACK OF YOUR PROGRESS',
          image: Image.asset('assets/images/progress.png')),
      ItemPageView(
          title: 'JOIN A SUPPORTIVE COMMUNITY',
          image: Image.asset('assets/images/community_support.png')),
    ];
    notifyListeners();
  }

  void setIndex(value) {
    index = value;
    notifyListeners();
  }
}
