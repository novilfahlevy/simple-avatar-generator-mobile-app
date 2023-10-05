import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:avatar_generator/screens/main_screen.dart';

import 'package:avatar_generator/screens/view_models/main_view_model.dart';
import 'package:avatar_generator/screens/view_models/feeds_view_model.dart';
import 'package:avatar_generator/screens/view_models/search_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainViewModel(),),
        ChangeNotifierProvider(create: (context) => FeedsViewModel(),),
        ChangeNotifierProvider(create: (context) => SearchViewModel(),),
      ],
      child: const App()
    )
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avatar Generator',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        MainScreen.routePath: (context) => const MainScreen(),
      }
    );
  }
}