import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:avatar_generator/screens/view_models/main_view_model.dart';

class MainScreen extends StatefulWidget {
  static const String routePath = '/';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final MainViewModel mainViewModel = Provider.of<MainViewModel>(context);

    return SafeArea(
      child: Scaffold(
        body: mainViewModel.screens[mainViewModel.selectedScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: mainViewModel.selectedScreenIndex,
          onTap: mainViewModel.setScreenIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search'
            )
          ],
        ),
      ),
    );
  }
}