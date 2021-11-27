import 'package:flutter/material.dart';
import 'package:flutter_design_1/style/configuration.dart';

class CatView extends StatelessWidget {
  const CatView(
      {Key? key, required this.image, required this.clr, required this.id})
      : super(key: key);
  final String image;
  final clr;
  final id;
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
                    color: Colors.white,
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
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.share),
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
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: shadowList,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120,
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
