import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'pages/about_page.dart';
import 'pages/home_page.dart';
import 'pages/menu_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Convex Menu Bar Demo',
      theme: ThemeData.dark(), // Temayı koyu renklerle değiştirin
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTabIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    MenuPage(),
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nişan Garden'),
      ),
      body: _pages[_selectedTabIndex],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Ana Sayfa'),
          TabItem(icon: Icons.menu, title: 'Menü'),
          TabItem(icon: Icons.info, title: 'Hakkımızda'),
        ],
        style: TabStyle.react, // Stili ayarlayın
        backgroundColor: Colors.grey[850], // Arkaplan rengini ayarlayın
        activeColor: Colors.blueAccent, // Aktif sekme rengini ayarlayın
        color: Colors.white, // Pasif sekme rengini ayarlayın
        elevation: 4, // Yükseltmeyi ayarlayın
        onTap: (int index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
      ),
    );
  }
}
