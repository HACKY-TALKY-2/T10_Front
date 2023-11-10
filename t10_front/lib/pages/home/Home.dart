import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:t10_front/pages/home/Info.dart';
import 'package:t10_front/pages/home/Upload.dart';
import 'package:t10_front/services/postService.dart';
import 'package:t10_front/utils/colors.dart';

import '../../model/PostModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _home createState() => _home();
}

class _home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostService>(
      builder: (context, postService, child) {
        postService.getAllPost();
        GetPost allPosts = postService.post;
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.shutter_speed,
                color: Colors.black,
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(

            children: [
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: ItemList(
                              title: "",
                              place: "",
                              total: 1,
                              current: 1,
                              isNear: false,
                            ),
                          ),
                          ListTile(
                            title: ItemList(
                              title: "",
                              place: "",
                              total: 2,
                              current: 1,
                              isNear: false,
                            ),
                          ),
                          ListTile(
                            title: ItemList(
                              title: "",
                              place: "",
                              total: 2,
                              current: 1,
                              isNear: false,
                            ),
                          ),
                          // Add more ListTiles as needed
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 16.0,
                right: 16.0,
                child: FloatingActionButton(
                  backgroundColor: UtilColor.mainColor,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Upload()));
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              backgroundColor: UtilColor.mainColor,

              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Upload()));
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
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
                                  style: Theme.of(context).textTheme.headline1,

                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, bottom: 10),

                                child: Text(
                                  widget.place,
                                  style: Theme.of(context).textTheme.subtitle1

                                ),
                              ),
                            ],
                          ),
                          if (widget.isNear)
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Column(children: [
                                Icon(Icons.fire_truck),
                                Text(
                                  '마감 임박!',
                                  style: Theme.of(context).textTheme.subtitle1,
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
                            style: Theme.of(context).textTheme.subtitle1,
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
                  style: Theme.of(context).textTheme.headline1,
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
