import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: true,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<StoryInfo> storyInfoList1 = [];
  List<StoryInfo> storyInfoList2 = [];
  PageController pageController1 = PageController();
  PageController pageController2 = PageController();
  double currentPage1 = 0.0;
  double currentPage2 = 0.0;
  @override
  void initState() {
    super.initState();
    pageController1.addListener(() {
      setState(() {
        currentPage1 = pageController1.page;
      });
      print('current page = $currentPage1');
    });
    pageController2.addListener(() {
      setState(() {
        currentPage2 = pageController2.page;
      });
      print('current page = $currentPage2');
    });

    storyInfoList1.add(
      StoryInfo(
          imgUrl: 'https://picsum.photos/id/609/400/600',
          title: '1 he everyone'),
    );
    storyInfoList1.add(
      StoryInfo(
          imgUrl: 'https://picsum.photos/id/780/400/600',
          title: '2 he everyone'),
    );
    storyInfoList1.add(
      StoryInfo(
          imgUrl: 'https://picsum.photos/id/475/400/600',
          title: '3 he everyone'),
    );
    storyInfoList1.add(
      StoryInfo(
          imgUrl: 'https://picsum.photos/id/1074/400/600',
          title: '4 he everyone'),
    );
    storyInfoList1.add(
      StoryInfo(
          imgUrl: 'https://picsum.photos/id/892/400/600',
          title: '5 he everyone'),
    );
    storyInfoList1.add(
      StoryInfo(
          imgUrl: 'https://picsum.photos/id/244/400/600',
          title: '6 he everyone'),
    );
    storyInfoList1.add(
      StoryInfo(
          imgUrl: 'https://picsum.photos/id/371/400/600',
          title: '7 he everyone'),
    );
    storyInfoList1.add(
      StoryInfo(
          imgUrl: 'https://picsum.photos/id/402/400/600',
          title: '8 he everyone'),
    );
    storyInfoList1.add(
      StoryInfo(
          imgUrl: 'https://picsum.photos/id/797/400/600',
          title: '9 he everyone'),
    );
    storyInfoList1.add(
      StoryInfo(
          imgUrl: 'https://picsum.photos/id/376/400/600',
          title: '10 he everyone'),
    );
    storyInfoList2.add(
      StoryInfo(
          imgUrl: 'https://picsum.photos/id/202/400/600',
          title: '8 he everyone'),
    );
    storyInfoList2.add(
      StoryInfo(
          imgUrl: 'https://picsum.photos/id/335/400/600',
          title: '9 he everyone'),
    );
    storyInfoList2.add(
      StoryInfo(
          imgUrl: 'https://picsum.photos/id/876/400/600',
          title: '10 he everyone'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BuildBackground(),
          ListView(
            shrinkWrap: true,
            children: [
              BuildNavigationBar(),
              BuildTrending(
                title: 'Trending',
                tag: 'Animated',
                sCount: 25,
              ),
              BuildStoryCards(
                pageController: pageController1,
                currentPage: currentPage1,
                storyInfoList: storyInfoList1,
              ),
              BuildTrending(
                title: 'Favorite',
                tag: 'Test',
                sCount: 12,
              ),
              BuildStoryCards(
                pageController: pageController2,
                currentPage: currentPage2,
                storyInfoList: storyInfoList2,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BuildBackground extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 45, 52, 71),
              Color.fromARGB(255, 26, 30, 68),
            ]),
      ),
    );
  }
}

class BuildNavigationBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildTrending extends StatelessWidget {
  final String title;
  final String tag;
  final int sCount;
  const BuildTrending({this.title, this.tag, this.sCount});
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    decoration: ShapeDecoration(
                      color: Color.fromARGB(255, 248, 112, 111),
                      shape: StadiumBorder(),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$sCount+ Stories',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 79, 113, 164)),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}

class BuildStoryCards extends StatelessWidget {
  final List<StoryInfo> storyInfoList;
  final PageController pageController;
  final double currentPage;
  const BuildStoryCards(
      {this.pageController, this.currentPage, this.storyInfoList});

  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(top: 20),
      height: 450,
      child: Stack(
        children: [
          Cards(
            currentPage: currentPage,
            storyInfoList: storyInfoList,
          ),
          PageView.builder(
            controller: pageController,
            itemCount: storyInfoList.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    print('tap: $currentPage');
                    int index = currentPage.toInt();
                    StoryInfo tInfo = storyInfoList[index];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => MyPage(
                          storyInfo: tInfo,
                        ),
                      ),
                    );
                  },
                  child: Container(
                      // child: Placeholder(),
                      ));
            },
          )
        ],
      ),
    );
  }
}

class Cards extends StatefulWidget {
  final List<StoryInfo> storyInfoList;
  final double currentPage;
  const Cards({Key key, this.currentPage, this.storyInfoList})
      : super(key: key);
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      List<Widget> stackWidget = [];

      double cardAspectRatio = 3 / 4;

      double width = constraints.maxWidth;
      double height = constraints.maxHeight;

      double padding = 20.0;

      double cardsAreaWidth = width - padding * 2;
      double cardsAreaHeight = height - padding * 2;

      double cardHeight = cardsAreaHeight;
      double cardWidth = cardHeight * cardAspectRatio;

      double intervalLeft = cardWidth + padding;
      double intervalRight = (cardsAreaWidth - cardWidth) / 2;

      for (int i = 0; i < widget.storyInfoList.length; i++) {
        StoryInfo storyInfo = widget.storyInfoList[i];
        double end = 0.0;
        double currentPosition = -(widget.currentPage - i);
        print('i = $i, and current position: $currentPosition');
        if (currentPosition <= 0) {
          end = padding + intervalRight * 2 - (intervalLeft * currentPosition);
        } else {
          end = padding + intervalRight * (2 - currentPosition);
        }
        if (end < padding) {
          end = padding;
        }
        Widget card = Positioned.directional(
          textDirection: TextDirection.ltr,
          top: padding + 20 * max(currentPosition, 0),
          bottom: padding + 20 * max(currentPosition, 0),
          end: end,
          child: AspectRatio(
            aspectRatio: cardAspectRatio,
            child: Hero(
              tag: widget.storyInfoList[i].imgUrl,
              child: Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: NetworkImage(storyInfo.imgUrl),
                        fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          blurRadius: 10,
                          offset: Offset(6, 6))
                    ]),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Spacer(
                        flex: 11,
                      ),
                      Expanded(
                        child: Text(
                          storyInfo.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                          decoration: ShapeDecoration(
                            color: Color.fromARGB(255, 67, 154, 232),
                            shape: StadiumBorder(),
                          ),
                          child: Text(
                            'Go ahead',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
        stackWidget.add(card);
      }
      stackWidget = stackWidget.reversed.toList();
      return Stack(
        children: stackWidget,
      );
    });
  }
}

class StoryInfo {
  String imgUrl;
  String title;
  StoryInfo({this.imgUrl, this.title});
}

class MyPage extends StatelessWidget {
  final StoryInfo storyInfo;
  const MyPage({Key key, this.storyInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: storyInfo.imgUrl,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
                image: NetworkImage(storyInfo.imgUrl), fit: BoxFit.cover),
          ),
          child: Container(
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 40, top: 30),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  storyInfo.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: ShapeDecoration(
                    color: Color.fromARGB(255, 67, 154, 232),
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    'Go ahead',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
