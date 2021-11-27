import 'package:flutter/material.dart';
import 'package:flutter_design_1/pages/pet_view.dart';
import 'package:flutter_design_1/style/configuration.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
//  with SingleTickerProviderStateMixin
{
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  int _currentIndex = 0;

  // TabController? _controller;
  // @override
  // void initState() {
  //   _controller = TabController(length: categories.length, vsync: this);
  //   super.initState();
  // }

  final screens = [
    Tab(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Pets(
            image: 'images/pet-cat1.png',
            clr: Colors.blueGrey[200],
            id: "1",
          ),
          Pets(
            image: 'images/pet-cat2.png',
            clr: Colors.orange[200],
            id: "2",
          ),
          Pets(
            image: 'images/pet-cat1.png',
            clr: Colors.yellow[200],
            id: "3",
          ),
        ],
      ),
    ),
    Tab(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Pets(
            image: 'images/dog-2.png',
            clr: Colors.red[200],
            id: "3",
          ),
          Pets(
            image: 'images/dog-1.png',
            clr: Colors.green[200],
            id: "4",
          ),
        ],
      ),
    ),
    Tab(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Pets(
            image: 'images/dog-1.png',
            clr: Colors.red[200],
            id: "3",
          ),
          Pets(
            image: 'images/dog-2.png',
            clr: Colors.green[200],
            id: "4",
          ),
        ],
      ),
    ),
    Tab(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Pets(
            image: 'images/pet-cat2.png',
            clr: Colors.blueGrey[200],
            id: "1",
          ),
          Pets(
            image: 'images/pet-cat1.png',
            clr: Colors.orange[200],
            id: "2",
          ),
          Pets(
            image: 'images/pet-cat2.png',
            clr: Colors.yellow[200],
            id: "3",
          ),
        ],
      ),
    ),
    Tab(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Pets(
            image: 'images/dog-1.png',
            clr: Colors.red[200],
            id: "3",
          ),
          Pets(
            image: 'images/dog-2.png',
            clr: Colors.green[200],
            id: "4",
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(isDrawerOpen ? 30 : 0),
        ),
        duration: Duration(milliseconds: 250),
        child: Column(
          children: [
            SizedBox(
              height: isDrawerOpen ? 20 : 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDrawerOpen
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              xOffset = 250;
                              yOffset = 150;
                              scaleFactor = 0.6;
                              isDrawerOpen = true;
                            });
                          },
                          icon: Icon(
                            Icons.menu_rounded,
                          ),
                        ),
                  Column(
                    children: [
                      Text("Location"),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: primaryGreen,
                          ),
                          Text("Kerala")
                        ],
                      )
                    ],
                  ),
                  CircleAvatar(),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search),
                  Text('Search pet to adopt'),
                  Icon(Icons.settings)
                ],
              ),
            ),
            DefaultTabController(
              initialIndex: 0,
              length: categories.length,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.blue,
                  physics: BouncingScrollPhysics(),
                  indicatorWeight: .001,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  tabs: [
                    ...categories.map(
                      (element) => Container(
                        height: 96,
                        child: Tab(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: categories[_currentIndex] == element
                                      ? primaryGreen
                                      : Colors.white,
                                  boxShadow: shadowList,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  element["iconPath"],
                                  height: 50,
                                  width: 50,
                                  color: categories[_currentIndex] == element
                                      ? Colors.white
                                      : Colors.grey[700],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  element['name'],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: screens[_currentIndex],
              ),
              // TabBarView(
              //   physics: BouncingScrollPhysics(),
              //   controller: _controller,
              //   children: screens,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

class Pets extends StatelessWidget {
  const Pets(
      {Key? key, required this.image, required this.clr, required this.id})
      : super(key: key);
  final String image;
  final clr;
  final id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CatView(
              image: image,
              clr: clr,
              id: id,
            ),
          ),
        );
      },
      child: Container(
        height: 240,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: clr,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: shadowList,
                    ),
                    margin: EdgeInsets.only(top: 50),
                  ),
                  Align(
                    child: Hero(
                      tag: id,
                      child: Image.asset(image),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: 65,
                  bottom: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: shadowList,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
