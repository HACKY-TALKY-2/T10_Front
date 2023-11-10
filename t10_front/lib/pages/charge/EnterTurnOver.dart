import 'package:flutter/material.dart';

class EnterTurnOverPageWidget extends StatefulWidget {
  @override
  _EnterTurnOverPageWidgetState createState() =>
      _EnterTurnOverPageWidgetState();
}

class _EnterTurnOverPageWidgetState extends State<EnterTurnOverPageWidget> {
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 55,
          child: FloatingActionButton.extended(
              elevation: 0,
              backgroundColor: Colors.blue,
              onPressed: () {},
              label: Container(
                  width: MediaQuery.of(context).size.width * 0.88,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 64,
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  title: Column(
                                    children: <Widget>[
                                      Text("충전 완료"),
                                    ],
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "당근 페이 충전 완료되었습니다!",
                                      ),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        padding: const EdgeInsets.all(20.0),
                                        foregroundColor: Color(0xffFFB74D),
                                        textStyle:
                                            const TextStyle(fontSize: 20),
                                      ),
                                      child: Text("확인"),
                                      onPressed: () {},
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 64,
                          child: Text(
                            '충전하기',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: -0.36,
                            ),
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 32, 0),
                          alignment: Alignment.center,
                          width: 64,
                          child: Text(
                            '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ))
                    ],
                  )))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "토스머니 충전",
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Color(0xFF14181B),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "잔액 : 170,120원",
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Color(0xFF57636C),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Text(
              '${phoneNumber}원',
              style: TextStyle(fontSize: 32.0),
            ),
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
                ))
          ],
        ),
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
