import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:t10_front/pages/home/Info.dart';
import 'package:t10_front/utils/colors.dart';

class Current extends StatefulWidget {
  const Current({Key? key}) : super(key: key);

  @override
  _current createState() => _current();
}

class _current extends State<Current> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: ItemList(
                      title: '책상',
                      place: '1길',
                      total: 5,
                      current: 2,
                      isNear: false,
                    ),
                  ),
                  ListTile(
                    title: ItemList(
                      title: '물',
                      place: '2길',
                      total: 100,
                      current: 70,
                      isNear: true,
                    ),
                  ),
                  // Add more ListTiles as needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  final String title;
  final String place;
  final int total;
  final int current;
  final bool isNear;

  ItemList(
      {required this.title,
      required this.place,
      required this.total,
      required this.current,
      required this.isNear});

  @override
  _itemList createState() => _itemList();
}

class _itemList extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    double percent = widget.current / widget.total;

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: UtilColor.lightGrey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 100,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: UtilColor.mainColor),
                  margin: EdgeInsets.all(10),
                  width: 70,
                  height: 70,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    right: 10, top: 20, bottom: 10),
                                child: Text(
                                  widget.title,
                                  style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, color: UtilColor.lightGrey),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, bottom: 10),
                                child: Text(widget.place,
                                    style:
                                        TextStyle(fontSize: 10.0, color: UtilColor.lightGrey)),
                              ),
                            ],
                          ),
                          if (widget.isNear)
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Column(children: [
                                Icon(Icons.fire_truck),
                                Text(
                                  '마감',
                                  style: TextStyle(fontSize: 10.0, color: UtilColor.lightGrey),
                                )
                              ]),
                            )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            child: LinearPercentIndicator(
                              padding: EdgeInsets.all(0),
                              percent: percent,
                              lineHeight: 10,
                              backgroundColor: Colors.black,
                              progressColor: UtilColor.mainColor,
                              width: 90,
                            ),
                          ),
                          Text(
                            '${widget.current}/${widget.total}',
                            style: TextStyle(fontSize: 10.0, color: UtilColor.lightGrey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              child: Container(
                child: Text(
                  '1개 당 10,000원',
                  style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 201, 201, 201)),
                ),
                margin: EdgeInsets.all(15),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Info(),
            ));
      },
    );
  }
}
