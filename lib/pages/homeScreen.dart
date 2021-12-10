import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/pages/pet_view.dart';
import '/style/configuration.dart';

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
            name: "kitty",
          ),
          Pets(
            image: 'images/pet-cat2.png',
            clr: Colors.orange[200],
            id: "2",
            name: "Ruby",
          ),
          Pets(
            image: 'images/pet-cat1.png',
            clr: Colors.yellow[200],
            id: "3",
            name: "Storm",
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
            name: "Chikku",
          ),
          Pets(
            image: 'images/dog-1.png',
            clr: Colors.green[200],
            id: "4",
            name: "Vava",
          ),
        ],
      ),
    ),
    Tab(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Pets(
            image: 'images/rab-1.png',
            clr: Colors.blueGrey[200],
            id: "3",
            name: "Storm",
          ),
        ],
      ),
    ),
    Tab(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Pets(
            image: 'images/par-1.png',
            clr: Colors.blueGrey[200],
            id: "1",
            name: "Storm",
          ),
        ],
      ),
    ),
    Tab(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Pets(
            image: 'images/hor-1.png',
            clr: Colors.red[200],
            id: "3",
            name: "Storm",
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(isDrawerOpen ? 30 : 0),
        ),
        duration: Duration(milliseconds: 200),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 15,
                left: 10,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: isDrawerOpen
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
                              color: Colors.grey[700],
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
                              color: Colors.grey[700],
                            ),
                          ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Location",
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.grey[600],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 17,
                            color: primaryGreen,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Kerala,",
                            style: GoogleFonts.roboto(
                              color: Colors.grey[800],
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Text(
                              "India",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "images/a1.jpg",
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(isDrawerOpen ? 30 : 0),
                ),
                color: Colors.grey[200],
              ),
              margin: EdgeInsets.only(top: 80),
              child: Column(
                children: [
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
                        Text(
                          'Search pet to adopt',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
                              height: 94,
                              child: Tab(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color:
                                            categories[_currentIndex] == element
                                                ? primaryGreen
                                                : Colors.white,
                                        boxShadow: shadowList,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Image.asset(
                                        element["iconPath"],
                                        height: 45,
                                        width: 45,
                                        color:
                                            categories[_currentIndex] == element
                                                ? Colors.white
                                                : Colors.grey[700],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        element['name'],
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                        ),
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
            )
          ],
        ),
      ),
    );
  }
}

class Pets extends StatelessWidget {
  const Pets({
    Key? key,
    required this.image,
    required this.clr,
    required this.id,
    required this.name,
  }) : super(key: key);
  final String image;
  final clr;
  final id;
  final name;
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
              name: name,
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
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: clr,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: shadowList,
                    ),
                    margin: EdgeInsets.only(top: 60),
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
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(
                  top: 75,
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
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: GoogleFonts.lato(
                              color: Colors.grey[700],
                              fontSize: 23,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Icon(
                            Icons.male_outlined,
                            color: Colors.grey[700],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Europian",
                          style: GoogleFonts.lato(
                            color: Colors.grey[700],
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "2 years old",
                          style: GoogleFonts.poppins(
                            color: Colors.grey[500],
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 17,
                            color: primaryGreen,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Distance: 7.6 km",
                            style: GoogleFonts.lato(
                              color: Colors.grey[500],
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
