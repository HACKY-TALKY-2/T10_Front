import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:t10_front/utils/colors.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  _info createState() => _info();
}

class _info extends State<Info> {
  final PageController _pageController = PageController();
  final List<String> _pageTitles = ['Image 1', 'Image 2', 'Image 3'];
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    // Add a listener to the PageController
    _pageController.addListener(() {
      // Update the current page index when the page changes
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 400,
                color: Colors.amber,
                child: PageView(
                  controller: _pageController,
                  children:
                      _pageTitles.map((title) => _buildPage(title)).toList(),
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      margin: EdgeInsets.only(right: 10, left: 10),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      '닉네임',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 13),
                                    ),
                                  ),
                                  Text(
                                    '위치',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: UtilColor.subTitle),
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  '10,000원',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800, fontSize: 13),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: const Color.fromARGB(255, 207, 207, 207),
                width: MediaQuery.of(context).size.width - 20,
              )
            ],
          )
        ],
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
