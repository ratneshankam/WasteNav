import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/src/features/authentication/screens/Rewards_screen/rewards.dart';
import 'package:test_app/src/features/authentication/screens/profile/update_profile_screen.dart';
import 'package:test_app/src/features/authentication/screens/welcome/aboutus.dart';
import 'package:test_app/src/features/authentication/screens/welcome/complaints.dart';
import 'package:test_app/src/features/authentication/screens/welcome/home_screen.dart';
import 'package:test_app/src/features/authentication/screens/welcome/login.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              accountName: Text(
                "Programmer",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "user@gmail.com",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              currentAccountPicture: Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/Avtar.jpg"),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen())),
            child: const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.green,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ComplaintPage())),
            child: const ListTile(
              leading: Icon(
                CupertinoIcons.pen,
                color: Colors.green,
              ),
              title: Text(
                "Complaints",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AppUsageRewards())),
            child: const ListTile(
              leading: Icon(
                CupertinoIcons.gift,
                color: Colors.green,
              ),
              title: Text(
                "Rewards",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // InkWell(
          //   onTap: () => Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const UpdateProfileScreen())),
          //   child: const ListTile(
          //     leading: Icon(
          //       CupertinoIcons.person,
          //       color: Colors.green,
          //     ),
          //     title: Text(
          //       "Edit Profile",
          //       style: TextStyle(
          //         fontSize: 18,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
          InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen())),
            child: const ListTile(
              leading: Icon(
                Icons.notifications_outlined,
                color: Colors.green,
              ),
              title: Text(
                "Notifications",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutUsPage())),
            child: const ListTile(
              leading: Icon(
                CupertinoIcons.info,
                color: Colors.green,
              ),
              title: Text(
                "About Us",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  Login())),
            child: const ListTile(
              leading: Icon(
                Icons.exit_to_app_outlined,
                color: Colors.green,
              ),
              title: Text(
                "LogOut",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
