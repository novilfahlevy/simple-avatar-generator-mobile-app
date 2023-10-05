import 'package:flutter/material.dart';

import 'package:avatar_generator/screens/feeds_screen.dart';
import 'package:avatar_generator/screens/search_screen.dart';

class MainViewModel extends ChangeNotifier {
  final List<Widget> screens = [
    const FeedsScreen(),
    const SearchScreen()
  ];

  int selectedScreenIndex = 0;

  void setScreenIndex(int index) {
    selectedScreenIndex = index;
    notifyListeners();
  }
}