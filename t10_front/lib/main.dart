import 'package:flutter/material.dart';
import 'package:t10_front/pages/home/Home.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: MainApp()),
  );
}

class MainApp extends StatefulWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  _MainApp createState() => _MainApp();
}

int _currentIndex = 0;

class _MainApp extends State<MainApp> {
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      Home(),
      Home(),
      Home(),
      Home(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Container(
          margin: EdgeInsets.only(right: 10), 
          child: Icon(Icons.abc))
      ]),
      extendBody: true,
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 212, 212, 212), // 그림자 색상
            blurRadius: 20, // 그림자의 흐림 정도
            spreadRadius: 4, // 그림자의 확산 정도
            offset: Offset(0, 1), // 그림자의 위치 (가로, 세로)
          ),
        ]),
        height: 120,
        child: BottomNavigationBar(
          selectedLabelStyle: TextStyle(
            color: Color.fromRGBO(48, 48, 48, 0.8),
            fontSize: 10,
            fontFamily: 'Pretendard',
          ),
          unselectedLabelStyle: TextStyle(
            color: Color.fromRGBO(48, 48, 48, 0.8),
            fontSize: 10,
            fontFamily: 'Pretendard',
          ),
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: TabItem(currentIndex: 0, name: '홈', icon: Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: TabItem(currentIndex: 1, name: '참여중', icon: Icons.inbox),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: TabItem(currentIndex: 2, name: '충전', icon: Icons.charging_station),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: TabItem(currentIndex: 3, name: '알림', icon: Icons.notification_add),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final int currentIndex;
  final String name;
  final IconData icon;

  TabItem({required this.currentIndex, required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 0, bottom: 5),
          height: 25,
          child: _currentIndex == currentIndex
              ? Icon(icon)
              : Icon(
                  icon,
                  color: Color.fromRGBO(217, 217, 217, 1),
                ),
        ),
        Text(
          name,
          style: TextStyle(
            color: Color.fromRGBO(48, 48, 48, 0.8),
            fontSize: 10,
            fontFamily: 'Pretendard',
          ),
        ),
      ],
    );
  }
}
