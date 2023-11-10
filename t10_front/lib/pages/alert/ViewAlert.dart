import 'package:flutter/material.dart';

class ViewAlertPageWidget extends StatefulWidget {
  const ViewAlertPageWidget({
    super.key,
  });
  @override
  _ViewAlertPageWidgetState createState() => _ViewAlertPageWidgetState();
}

class _ViewAlertPageWidgetState extends State<ViewAlertPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<int> states = [1, 2, 3, 4, 5];
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
          appBar: AppBar(
              title: Container(
                margin: EdgeInsets.all(15),
              ),
              elevation: 0.0,
              backgroundColor: Colors.white,
              actions: [
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.shutter_speed,
                      color: Colors.black,
                    ))
              ]),
          key: scaffoldKey,
          backgroundColor: const Color(0xfff5f5f5),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: 7,
                                  itemBuilder: (context, index) {
                                    return AlertCard(state: states[index % 5]);
                                  }),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class AlertCard extends StatelessWidget {
  const AlertCard({super.key, required this.state});
  final int state;

  @override
  Widget build(BuildContext context) {
    String alertText = "";
    String alertDetailText = "";
    switch (state) {
      case 1:
        alertText = '공동구매 참여 안내';
        alertDetailText = "내 공동구매에 OOO님이 참여했어요!";
        break;
      case 2:
        alertText = '마감 임박 안내';
        alertDetailText = '내 공동구매의 마감이 임박했어요!';
        break;
      case 3:
        alertText = "마감 안내";
        alertDetailText = '축하드려요! 내 공동구매가 마감되었어요!';
        break;
      case 4:
        alertText = "마감 임박 안내";
        alertDetailText = '내가 신청한 공동구매의 마감이 임박했어요!';
        break;
      case 5:
        alertText = "마감 안내";
        alertDetailText = '축하드려요! 내가 신청한 공동구매가 마감되었어요!';
        break;
    }
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xff757575),
                      width: 1.0,
                    ),
                  ),
                  margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: Container(
                      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Icon(
                          state == 1
                              ? Icons.pan_tool
                              : Icons.sentiment_very_satisfied,
                          color: state % 2 == 0
                              ? Colors.green
                              : Colors.blue))), //이미지 주소 추가 필요
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {},
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        alertText,
                                        style: Theme.of(context).textTheme.headline1,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      alertDetailText,
                                      style: Theme.of(context).textTheme.headline2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 6),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "yyyy.MM.dd",
                                      style: Theme.of(context).textTheme.subtitle1,
                                  ),
                                  TextSpan(
                                    text: ' | ',
                                      style: Theme.of(context).textTheme.subtitle1,
                                  ),
                                  TextSpan(
                                    text: "hh:mm",
                                      style: Theme.of(context).textTheme.subtitle1,
                                  ),
                                ],
                                style: TextStyle(
                                  fontFamily: 'SUITE',
                                  color: const Color(0xff757575),
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
