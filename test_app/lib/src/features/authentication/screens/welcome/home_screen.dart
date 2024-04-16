import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:test_app/src/Widgets/AppBarWidget.dart';
import 'package:test_app/src/Widgets/drawewrwidget.dart';
import 'package:test_app/src/features/authentication/screens/onboarding/on_boarding_screen.dart';
import 'package:test_app/src/features/authentication/screens/profile/profile_screen.dart';
import 'package:test_app/src/features/authentication/screens/welcome/aboutus.dart';
import 'package:test_app/src/features/authentication/screens/welcome/map_page.dart';
import 'package:test_app/src/features/authentication/screens/welcome/landing_page.dart';
import 'package:test_app/src/features/authentication/screens/welcome/post_page.dart';
import 'package:test_app/src/features/authentication/screens/welcome/profile_page.dart';
import 'package:test_app/src/features/authentication/screens/welcome/taxi_map_page.dart';
import 'package:test_app/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:test_app/src/features/authentication/screens/welcome/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _page = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey =
      GlobalKey<CurvedNavigationBarState>();
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const PostPage(),
    const MapPage(),
    const ProfileScreen1(),
    // const TaxiMapScreen(),
    // const AboutUsPage(),
  ];
  @override
  void initState() {
    super.initState();
    database = createMyDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Add a key to the Scaffold

      appBar: (_page == 0 || _page == 3)
          ? AppBar(
              toolbarHeight: 60,
              backgroundColor: Colors.green,
              automaticallyImplyLeading: false,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
              title: InkWell(
                onTap: () {
                  _scaffoldKey.currentState!
                      .openDrawer(); // Open the drawer using the key
                },
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: const Icon(Icons.menu),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    (_page == 3)
                        ? const Text(
                            'User Profile',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        : const Text(
                            'Welcome, User',
                            style: TextStyle(color: Colors.white),
                          ),
                  ],
                ),
              ),
              actions: [
                (_page == 0)
                    ? InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              )
                            ],
                          ),
                          child: const Icon(Icons.notifications),
                        ),
                      )
                    : Container(),
                const SizedBox(
                  width: 18,
                ),
              ],
            )
          : (_page == 2)
              ? null
              : AppBar(
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  title: InkWell(
                    onTap: () {
                      _scaffoldKey.currentState!
                          .openDrawer(); // Open the drawer using the key
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              )
                            ],
                          ),
                          child: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              colors: [Colors.black, Colors.green],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ).createShader(bounds);
                          },
                          child: const Text(
                            'Posts',
                            style: TextStyle(
                              fontSize: 36.0,
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .white, // This color will be ignored due to ShaderMask
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
      // Appbar closed

      drawer: DrawerWidget(),
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_page),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        animationCurve: Curves.fastOutSlowIn,
        key: _bottomNavigationKey,
        height: 50,
        animationDuration: const Duration(milliseconds: 300),
        items: <Widget>[
          (_page == 0)
              ? const Icon(
                  Icons.home_rounded,
                  size: 30,
                )
              : const Icon(
                  Icons.store_mall_directory_outlined,
                  size: 30,
                ),
          (_page == 1)
              ? const Icon(Icons.lightbulb, size: 30)
              : const Icon(Icons.lightbulb_outline_rounded, size: 30),
          (_page == 2)
              ? const Icon(Icons.person_pin_circle_rounded, size: 30)
              : const Icon(Icons.person_pin_circle_outlined, size: 30),
          (_page == 3)
              ? const Icon(Icons.person, size: 30)
              : const Icon(Icons.person_outline, size: 30),
        ],
        color: Colors.green,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
