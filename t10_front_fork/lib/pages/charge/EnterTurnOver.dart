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
                      Container(
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
              children: [Text("토스머니 충전"), Text("잔액 : 170,120원")],
            ),
            Text(
              '${phoneNumber}원',
              style: TextStyle(fontSize: 20.0),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 80),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NumberButton("1"),
                        NumberButton("2"),
                        NumberButton("3"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NumberButton("4"),
                        NumberButton("5"),
                        NumberButton("6"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NumberButton("7"),
                        NumberButton("8"),
                        NumberButton("9"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NumberButton("0"),
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
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          number,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

// class ClearButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // 클리어 버튼을 클릭하면 번호 초기화
//         _clearPhoneNumber();
//       },
//       child: Container(
//         margin: EdgeInsets.all(10.0),
//         padding: EdgeInsets.all(20.0),
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: Colors.red,
//             width: 2.0,
//           ),
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Icon(
//           Icons.clear,
//           size: 24.0,
//           color: Colors.red,
//         ),
//       ),
//     );
//   }

  
// }
