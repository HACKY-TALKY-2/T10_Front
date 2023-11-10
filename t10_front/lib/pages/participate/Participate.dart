import 'package:flutter/material.dart';
import 'package:t10_front/utils/colors.dart';

class Participate extends StatefulWidget {
  const Participate({Key? key}) : super(key: key);

  @override
  _participate createState() => _participate();
}

class _participate extends State<Participate> {
  final PageController _pageController = PageController();
  final List<String> _pageTitles = ['Page 1', 'Page 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        children: _pageTitles.map((title) => _buildPage(title)).toList(),
      ),
    );
  }

  Widget _buildPage(String title) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
