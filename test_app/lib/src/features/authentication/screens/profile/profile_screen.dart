import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:test_app/src/Widgets/drawewrwidget.dart';
import 'package:test_app/src/constants/colors.dart';
import 'package:test_app/src/constants/image_strings.dart';
import 'package:test_app/src/constants/sizes.dart';
import 'package:test_app/src/constants/text_strings.dart';
import 'package:test_app/src/features/authentication/screens/profile/update_profile_screen.dart';
import 'package:test_app/src/features/authentication/screens/profile/widget/profile_widget.dart';
import 'package:test_app/src/repository/authentication_repository/authentication_repository.dart';

class ProfileScreen1 extends StatelessWidget {
   const ProfileScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(

        // appBar: AppBar(
        //   leading: IconButton(
        //     onPressed: () {},
        //     icon: const Icon(LineAwesomeIcons.angle_left),
        //   ),
        //   centerTitle: true,
        //   title: Text(
        //     profile,
        //     style: Theme.of(context).textTheme.headlineMedium,
        //   ),
        //   actions: [
        //     IconButton(
        //         onPressed: () {},
        //         icon:
        //             Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        //   ],
        // ),
        
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                      image: AssetImage(profileImg),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: tPrimaryColor,
                    ),
                    child: const Icon(
                      LineAwesomeIcons.alternate_pencil,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              profileHeading,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              profileSubHeading,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UpdateProfileScreen())),
                style: ElevatedButton.styleFrom(
                  backgroundColor: tPrimaryColor,
                  side: BorderSide.none,
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  editProfile,
                  style: TextStyle(color: tDarkColor),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            ProfileMenuWidget(
              title: "Setting",
              icon: LineAwesomeIcons.cog,
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "User Management",
              icon: LineAwesomeIcons.user_check,
              onPress: () {},
            ),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            ProfileMenuWidget(
              title: "Information",
              icon: LineAwesomeIcons.info,
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Logout",
              icon: LineAwesomeIcons.alternate_sign_out,
              textColor: Colors.red,
              endIcon: false,
              onPress: () {
                AuthenticationRepository.instance.logout();
              },
            )
          ],
        ),
      ),
    ));
  }
}
