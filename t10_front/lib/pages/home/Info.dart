import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:t10_front/services/postService.dart';
import 'package:provider/provider.dart';
import 'package:t10_front/model/PostModel.dart';

import 'package:t10_front/utils/colors.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  _info createState() => _info();
}

var _controller = TextEditingController();

void _showAlertDialog(BuildContext context, String text) {
  @override
  TextEditingController _titleTextController = TextEditingController();
  TextEditingController _priceTextController = TextEditingController();
  TextEditingController _peopleTextController = TextEditingController();
  TextEditingController _contentTextController = TextEditingController();
  TextEditingController _urlTextController = TextEditingController();
  FocusNode _focusNode2 = FocusNode();
  dynamic division = 0;

  String IsTab = '';

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer<PostService>(builder: (context, postService, child) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            title: Text('나의 구매 수량은...',
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, color: Colors.black)),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 70,
                  child: TextField(
                    keyboardType: TextInputType.number, // 키보드 타입을 숫자로 설정
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    controller: _controller,
                    cursorColor: UtilColor.mainColor,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ), // 파란색 테두리 없앰
                      ),
                    ),
                  ),
                ),
                Text(
                  '개',
                  style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, color: Colors.black),
                )
              ],
            ),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 0, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        PostPost _postInfo = PostPost(
                            memberKeyId: 3,
                            title: _titleTextController.text,
                            content: _contentTextController.text,
                            itemPrice: int.tryParse(_priceTextController.text),
                            tradePlace: "역삼역",
                            kakao: _urlTextController.text,
                            totalItemCount:
                                int.tryParse(_peopleTextController.text),
                            totalPeople:
                                int.tryParse(_peopleTextController.text),
                            location: "역삼역 3번 출구",
                            multipartFile: null);
                        postService.uploadPost(_postInfo);
                        Navigator.of(context).pop(); // 모달 닫기
                        setState(() {
                          IsTab = 'confirm';
                        });
                      },
                      child: Container(
                        width: 75,
                        height: 31,
                        decoration: BoxDecoration(
                          color: IsTab == 'confirm'
                              ? Colors.white
                              : UtilColor.mainColor,
                          borderRadius: BorderRadius.circular(10), // 둥근 모서리 설정
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            text,
                            style: IsTab == 'confirm'
                                ? TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, color: Colors.black)
                                : TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      child: Container(
                        width: 75,
                        height: 31,
                        decoration: BoxDecoration(
                          color: IsTab == 'cancel'
                              ? Colors.white
                              : UtilColor.mainColor,
                          borderRadius: BorderRadius.circular(10), // 둥근 모서리 설정
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '취소',
                            style: IsTab == 'cancel'
                                ? TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, color: Colors.black)
                                : TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 13),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // 모달 닫기
                        setState(() {
                          IsTab = 'cancel';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        });
      });
    },
  );
}

class _info extends State<Info> {
  final PageController _pageController = PageController();
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
                                    child: Text('닉네임',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1),
                                  ),
                                  Text('위치',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 5),
                                          child: LinearPercentIndicator(
                                            padding: EdgeInsets.all(0),
                                            percent: 0.7,
                                            lineHeight: 10,
                                            backgroundColor: Colors.black,
                                            progressColor: UtilColor.mainColor,
                                            width: 90,
                                          ),
                                        ),
                                        Text(
                                          '2/5',
                                          // '${widget.current}/${widget.total}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Text('10,000원',
                                    style:
                                        TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, color: Colors.black)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 1,
                    color: const Color.fromARGB(255, 207, 207, 207),
                    width: MediaQuery.of(context).size.width - 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '물 사세요',
                          style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          '2023-11-11 2:53',
                          style: TextStyle(fontSize: 10.0, color: UtilColor.lightGrey),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            // 'ds',
                            '물 사세요 물 안 사세요?\n물 사세요 물 안 사세요?\n',
                            style: TextStyle(fontSize: 13.0, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      bottomSheet: Stack(
        alignment: Alignment.centerRight,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: BottomAppBar(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        '나는 지금...',
                        style: TextStyle(fontSize: 10.0, color: Colors.black),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 50, right: 10),
                          child: Text(
                            '10,000원',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w800),
                          ),
                        ),
                        Text(
                          '(10개)',
                          style: TextStyle(fontSize: 10.0, color: UtilColor.lightGrey),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: GestureDetector(
                            child: Icon(
                              Icons.edit,
                            ),
                            onTap: () {
                              _showAlertDialog(context, "수정하기");
                              // 수정 모달 띄우기
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        '* 실제 정산액은 아니에요!',
                        style: TextStyle(fontSize: 10.0, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
            right: 20,
            child: GestureDetector(
                onTap: () {
                  _showAlertDialog(context, "참여하기");
                },
                child: Container(
                  width: 70,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: UtilColor.mainColor),
                  child: Center(
                      child: Text(
                    '참여하기',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  )),
                )),
          )
        ],
      ),
    );
    ;
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
