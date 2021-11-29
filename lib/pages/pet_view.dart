import 'package:flutter/material.dart';
import 'package:flutter_design_1/style/configuration.dart';
import 'package:google_fonts/google_fonts.dart';

class CatView extends StatelessWidget {
  const CatView({
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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    color: clr,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey[100],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey[700],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: id,
                child: Image.asset(
                  image,
                  height: 300,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: shadowList,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: GoogleFonts.roboto(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Europian",
                            style: GoogleFonts.lato(
                              color: Colors.grey[700],
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "2 years old",
                            style: GoogleFonts.poppins(
                              color: Colors.grey[700],
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
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
                            "Near carnival infopark, kochi",
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
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 5,
                margin: EdgeInsets.only(bottom: 120),
                child: Column(
                  children: [
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "images/a2.png",
                          height: 40,
                        ),
                      ),
                      title: Text(
                        "Sunny joseph",
                        style: GoogleFonts.lato(
                          color: Colors.grey[700],
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        "Owner",
                        style: GoogleFonts.lato(
                          color: Colors.grey[500],
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: Text(
                        "May 25, 2021",
                        style: GoogleFonts.mulish(
                          color: Colors.grey[500],
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "My job requires moving anothet count. I don't have the oppotunity to take the pet with me. I am looking for good people who will shelter my pet.",
                        style: GoogleFonts.roboto(
                          color: Colors.grey[500],
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: primaryGreen,
                        ),
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: primaryGreen,
                        ),
                        height: 50,
                        width: 50,
                        child: Center(
                          child: Text(
                            "ADOPTION",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
