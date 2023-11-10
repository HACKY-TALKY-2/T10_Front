import 'package:flutter/material.dart';
import 'package:t10_front/pages/participate/Done.dart';
import 'package:t10_front/pages/participate/Current.dart';
import 'package:t10_front/utils/colors.dart';

class Participate extends StatefulWidget {
  const Participate({Key? key}) : super(key: key);

  @override
  _ParticipateState createState() => _ParticipateState();
}

class _ParticipateState extends State<Participate>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 탭 컨트롤러 초기화
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // 페이지가 소멸될 때 탭 컨트롤러도 소멸
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

            Container(
                margin: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.shutter_speed,
                  color: Colors.black,
                ))
          ],
        backgroundColor: Colors.white,
        bottom: TabBar(
          indicatorColor: UtilColor.mainColor,
          controller: _tabController,
          labelColor: UtilColor.mainColor,
          tabs: [
            Tab(text: '참여 중', ),
            Tab(text: '수령 완료'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Done(),
          Current(),
        ],
      ),
    );
  }
}
