import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/All_Category_Screen.dart';
import 'screens/popular_Courses_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Education App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
       // '/': (context) => const HomeScreen(),
        '/all-category': (context) => const AllCategoryScreen(),
        '/popular-courses': (context) => const PopularCoursesScreen(),
      },
    );
  }
}

// keep rest of your HomeScreen code here ...
