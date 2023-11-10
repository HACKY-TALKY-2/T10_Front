import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:t10_front/model/PointModel.dart';
import 'package:t10_front/services/chargeService.dart';

import 'package:t10_front/utils/colors.dart';

class EnterTurnOverPageWidget extends StatefulWidget {
  @override
  _EnterTurnOverPageWidgetState createState() =>
      _EnterTurnOverPageWidgetState();
}

class _EnterTurnOverPageWidgetState extends State<EnterTurnOverPageWidget> {
  String phoneNumber = "";
  String IsTab = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text("토스머니 충전",
                          style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, color: Colors.black)),
                      Text("잔액 : 170,120원",
                          style: TextStyle(fontSize: 10.0, color: Colors.black))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    '${phoneNumber}원',
                    style: TextStyle(fontSize: 32.0),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 80),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                NumberButton("1"),
                                NumberButton("2"),
                                NumberButton("3"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                NumberButton("4"),
                                NumberButton("5"),
                                NumberButton("6"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                NumberButton("7"),
                                NumberButton("8"),
                                NumberButton("9"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                NumberButton("    "),
                                NumberButton("0"),
                                ClearButton()
                                // IconButton(
                                //   onPressed: _clearPhoneNumber,
                                //   icon: Icon(Icons.arrow_back),
                                // )
                              ],
                            ),
                          ],
                        )),
                  ],
                )
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      title: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: <Widget>[
                            Text("충전 완료", style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, color: Colors.black)),
                          ],
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "당근 페이 충전 완료되었습니다!",
                            style: TextStyle(fontSize: 10.0, color: Colors.black),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(20.0),
                            foregroundColor: Color(0xffFFB74D),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          child: Container(
                            width: 50,
                            height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: UtilColor.mainColor,
                              ),
                              child: Center(
                                child: Text(
                                  "확인",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                              )),
                          onPressed: () {
                            Navigator.of(context).pop(); // 모달 닫기
                          },
                        ),
                      ],
                    );
                  });
              setState(() {
                IsTab = 'confirm';
              });
            },
            child: Container(
              width: 75,
              height: 31,
              decoration: BoxDecoration(
                color: UtilColor.mainColor,
                borderRadius: BorderRadius.circular(10), // 둥근 모서리 설정
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '충전하기',
                  style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 13),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updatePhoneNumber(String number) {
    setState(() {
      phoneNumber += number;
    });
  }

  void _clearPhoneNumber() {
    setState(() {
      phoneNumber == "";
    });
  }
}

class NumberButton extends StatelessWidget {
  final String number;

  NumberButton(this.number);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _EnterTurnOverPageWidgetState? pageState =
            context.findAncestorStateOfType<_EnterTurnOverPageWidgetState>();
        pageState?._updatePhoneNumber(number);
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Text(
          number,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class ClearButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 클리어 버튼을 클릭하면 번호 초기화
        _clearPhoneNumber(context);
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Icon(
          Icons.arrow_back,
        ),
      ),
    );
  }

  void _clearPhoneNumber(BuildContext context) {
    _EnterTurnOverPageWidgetState? pageState =
        context.findAncestorStateOfType<_EnterTurnOverPageWidgetState>();
    pageState?.setState(() {
      pageState?.phoneNumber = "";
    });
  }
}
