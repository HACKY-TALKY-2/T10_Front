import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:t10_front/model/PostModel.dart';
import 'package:t10_front/services/postService.dart';
import 'package:t10_front/utils/colors.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  _upload createState() => _upload();
}

class _upload extends State<Upload> {
  @override
  TextEditingController _titleTextController = TextEditingController();
  TextEditingController _priceTextController = TextEditingController();
  TextEditingController _peopleTextController = TextEditingController();
  TextEditingController _contentTextController = TextEditingController();
  TextEditingController _urlTextController = TextEditingController();
  FocusNode _focusNode2 = FocusNode();
  dynamic division = 0;

  String? item_img;
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        item_img = pickedFile.path;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // _focusNode2.addListener(_calculateDifferenceOnFocusChange);
  }

  @override
  void dispose() {
    // _focusNode2.removeListener(_calculateDifferenceOnFocusChange);
    _focusNode2.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Consumer<PostService>(builder: (context, postService, child) {
      return GestureDetector(
        child: Scaffold(
          floatingActionButton: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 55,
              child: FloatingActionButton.extended(
                  elevation: 0,
                  backgroundColor: UtilColor.MainColor,
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
                        totalPeople: int.tryParse(_peopleTextController.text),
                        location: "역삼역 3번 출구",
                        multipartFile: item_img);
                    postService.uploadPost(_postInfo);
                    Navigator.pop(context);
                  },
                  label: Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            child: Text(
                              '작성 완료',
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
                        ],
                      )))),
          backgroundColor: const Color(0xfff5f5f5),
          appBar: AppBar(title: Text('글 작성')),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          getImage(ImageSource.gallery);
                        },
                        child: Container(
                            padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                            height: 60,
                            width: 80,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black, // 원하는 border 색상 지정
                                width: 1.0, // 원하는 border 두께 지정
                              ),
                              borderRadius: BorderRadius.circular(
                                  10.0), // 원하는 border radius 지정
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [Icon(Icons.camera_alt), Text("사진 추가")],
                            ))),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                                child: Text(
                              "제목",
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF15161E),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                            TextFormField(
                              controller: _titleTextController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: "SUITE",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff757575)),
                                hintText: '제목을 입력하세요',
                                hintStyle: TextStyle(
                                    fontFamily: "SUITE",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff757575)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xffe0e0e0),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xffffb74d),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xfff44336),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xfff44336),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 12),
                              ),
                              style: TextStyle(
                                  fontFamily: "SUITE",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff757575)),
                              cursorColor: const Color(0xffffb74d),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                child: Text(
                              "가격",
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF15161E),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _priceTextController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: "SUITE",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff757575)),
                                hintText: '₩ 가격을 입력하세요',
                                hintStyle: TextStyle(
                                    fontFamily: "SUITE",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff757575)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xffe0e0e0),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xffffb74d),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xfff44336),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xfff44336),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 12),
                              ),
                              style: TextStyle(
                                  fontFamily: "SUITE",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff757575)),
                              cursorColor: const Color(0xffffb74d),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                child: Text(
                              "총 갯수",
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF15161E),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                            TextFormField(
                              focusNode: _focusNode2,
                              keyboardType: TextInputType.number,
                              controller: _peopleTextController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: "SUITE",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff757575)),
                                hintText: '상품 갯수를 입력하세요',
                                hintStyle: TextStyle(
                                    fontFamily: "SUITE",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff757575)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xffe0e0e0),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xffffb74d),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xfff44336),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xfff44336),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 12),
                              ),
                              style: TextStyle(
                                  fontFamily: "SUITE",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff757575)),
                              cursorColor: const Color(0xffffb74d),
                            ),
                            Container(
                                child: Text(
                              "오픈 채팅 주소소",
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF15161E),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                            TextFormField(
                              focusNode: _focusNode2,
                              keyboardType: TextInputType.number,
                              controller: _urlTextController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: "SUITE",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff757575)),
                                hintText: '오픈채팅 주소소를 입력하세요',
                                hintStyle: TextStyle(
                                    fontFamily: "SUITE",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff757575)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xffe0e0e0),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xffffb74d),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xfff44336),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xfff44336),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 12),
                              ),
                              style: TextStyle(
                                  fontFamily: "SUITE",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff757575)),
                              cursorColor: const Color(0xffffb74d),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     Text(
                            //       ' $division',
                            //       style: TextStyle(fontSize: 15.0),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(height: 10),
                            Container(
                                child: Text(
                              "자세한 설명",
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF15161E),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                            TextFormField(
                              controller: _contentTextController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: "SUITE",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff757575)),
                                hintText:
                                    '개인정보 및 신상을 작성할 경우 서비스 사용에 제한이 있을 수 있습니다.',
                                hintStyle: TextStyle(
                                    fontFamily: "SUITE",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff757575)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xffe0e0e0),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xffffb74d),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xfff44336),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xfff44336),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16, 24, 16, 12),
                              ),
                              style: TextStyle(
                                  fontFamily: "SUITE",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff757575)),
                              maxLines: 24,
                              minLines: 12,
                              cursorColor: const Color(0xffffb74d),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  // void _calculateDifferenceOnFocusChange() {
  //   _calculateDivision();
  // }

  // void _calculateDivision() {
  //   setState(() {
  //     int value1 = int.tryParse(_priceTextController.text) ?? 0;
  //     int value2 = int.tryParse(_peopleTextController.text) ?? 0;
  //     division = value2 == 0
  //         ? "인원 수를 입력하세요"
  //         : (value1 / value2).toInt().toString() + "원";
  //   });
  // }
}
