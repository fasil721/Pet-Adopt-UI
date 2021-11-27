import 'package:flutter/material.dart';
import 'package:flutter_design_1/style/configuration.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: primaryGreen,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              leading: CircleAvatar(),
              title: Text(
                "Muhammed Fasil",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                "Active status",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white60,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Column(
                  children: drawerItems
                      .map(
                        (element) => Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Icon(
                                element["icon"],
                                color: Colors.white60,
                                size: 25,
                              ),
                              SizedBox(width: 10),
                              Text(
                                element["title"],
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList()),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, bottom: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.white60,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white60,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    color: Colors.white60,
                    height: 20,
                    width: 2,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Log Out",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white60,
                    ),
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
