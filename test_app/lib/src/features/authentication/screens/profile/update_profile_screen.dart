import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:test_app/src/constants/colors.dart';
import 'package:test_app/src/constants/image_strings.dart';
import 'package:test_app/src/constants/sizes.dart';
import 'package:test_app/src/constants/text_strings.dart';
import 'package:test_app/src/features/authentication/controllers/login_controller.dart';
import 'package:test_app/src/features/authentication/controllers/profile_controller.dart';
import 'package:test_app/src/features/authentication/controllers/signup_controller.dart';
import 'package:test_app/src/features/authentication/models/user_model.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        centerTitle: true,
        title: Text(
          editProfile,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          // child: FutureBuilder(
          //   future: controller.getUserData(),
          //   builder: (context, AsyncSnapshot<UserModel> snapshot) {
          //     if (snapshot.connectionState == ConnectionState.done) {
          //       if (snapshot.hasData) {
          //         UserModel user = snapshot.data as UserModel;
          //         //Controllers
          //         final email = TextEditingController(text: user.email);
          //         final password = TextEditingController(text: user.password);
          //         final fullName = TextEditingController(text: user.fullName);
          //         final phoneNo = TextEditingController(text: user.phoneNo);
          //         final address = TextEditingController(text:user.address);
          //         return Column(children: [
          //           Stack(
          //             children: [
          //               SizedBox(
          //                 width: 120,
          //                 height: 120,
          //                 child: ClipRRect(
          //                   borderRadius: BorderRadius.circular(100),
          //                   child: const Image(
          //                     image: AssetImage(profileImg),
          //                   ),
          //                 ),
          //               ),
          //               Positioned(
          //                 bottom: 0,
          //                 right: 0,
          //                 child: Container(
          //                   width: 35,
          //                   height: 35,
          //                   decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(100),
          //                     color: tPrimaryColor,
          //                   ),
          //                   child: const Icon(
          //                     LineAwesomeIcons.camera,
          //                     size: 20,
          //                     color: Colors.black,
          //                   ),
          //                 ),
          //               )
          //             ],
          //           ),
          //           const SizedBox(
          //             height: 40,
          //           ),
          //           Form(
          //             child: Column(
          //               children: [
          //                 TextFormField(
          //                   controller: fullName,
          //                   // initialValue: userData.fullName,
          //                   decoration: const InputDecoration(
          //                       label: Text(tFullName),
          //                       prefixIcon: Icon(Icons.person_outline_rounded)),
          //                 ),
          //                 const SizedBox(height: tFormHeight - 20),
          //                 TextFormField(
          //                   controller: email,
          //                   // initialValue: userData.email,
          //                   decoration: const InputDecoration(
          //                       label: Text(tEmail),
          //                       prefixIcon: Icon(Icons.email_outlined)),
          //                 ),
          //                 const SizedBox(height: tFormHeight - 20),
          //                 TextFormField(
          //                   controller: phoneNo,
          //                   // initialValue: userData.phoneNo,
          //                   decoration: const InputDecoration(
          //                       label: Text(tPhoneNo),
          //                       prefixIcon: Icon(Icons.phone)),
          //                 ),
          //                 const SizedBox(height: tFormHeight - 20),
          //                 TextFormField(
          //                   controller: password,
          //                   // initialValue: userData.password,
          //                   obscureText: true,
          //                   decoration:  InputDecoration(
          //                       label: const Text(tPassword),
          //                       prefixIcon: const Icon(Icons.fingerprint),
          //                       suffixIcon: IconButton(icon:const Icon(LineAwesomeIcons.eye_slash), onPressed: (){},),
          //                       ),
          //                 ),
          //                 const SizedBox(height: tFormHeight - 20),
          //                 TextFormField(
          //                   controller: address,
          //                   // initialValue: userData.address,
          //                   decoration: const InputDecoration(
          //                       label: Text(" Your Address"),
          //                       prefixIcon: Icon(Icons.home_outlined)),
          //                 ),
          //                 const SizedBox(
          //                   height: tFormHeight,
          //                 ),
          //                 SizedBox(
          //                   width: double.infinity,
          //                   child: ElevatedButton(
          //                     onPressed: () async {
          //                       final userData = UserModel(
          //                           email: email.text.trim(),
          //                           password: password.text.trim(),
          //                           fullName: fullName.text.trim(),
          //                           phoneNo: phoneNo.text.trim(),
          //                           address: address.text.trim());
          //                       await controller.updateRecord(userData);
          //                       // Get.to(() =>  UpdateProfileScreen()),
          //                     },
          //                     style: ElevatedButton.styleFrom(
          //                       backgroundColor: tPrimaryColor,
          //                       side: BorderSide.none,
          //                       shape: const StadiumBorder(),
          //                     ),
          //                     child: const Text(
          //                       editProfile,
          //                       style: TextStyle(color: tDarkColor),
          //                     ),
          //                   ),
          //                 ),
          //                 const SizedBox(
          //                   height: tFormHeight,
          //                 ),
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     const Text.rich(TextSpan(
          //                         text: joined,
          //                         style: TextStyle(fontSize: 12),
          //                         children: [
          //                           TextSpan(
          //                               text: joinedAt,
          //                               style: TextStyle(
          //                                   fontWeight: FontWeight.bold,
          //                                   fontSize: 12)),
          //                         ])),
          //                     ElevatedButton(
          //                         onPressed: () {},
          //                         style: ElevatedButton.styleFrom(
          //                           backgroundColor:
          //                               Colors.redAccent.withOpacity(0.1),
          //                           elevation: 0,
          //                           foregroundColor: Colors.red,
          //                           shape: const StadiumBorder(),
          //                           side: BorderSide.none,
          //                         ),
          //                         child: const Text(delete))
          //                   ],
          //                 )
          //               ],
          //             ),
          //           )
          //         ]);           
          //       } else if (snapshot.hasError) {
          //         return Center(
          //           child: Text(snapshot.error.toString()),
          //         );
          //       } else {
          //         return const Center(
          //           child: Text("something went wrong"),
          //         );
          //       }
          //     } else {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // ),
          child: Column(children: [
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
                              LineAwesomeIcons.camera,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller.fullName,
                            // initialValue: userData.fullName,
                            decoration: const InputDecoration(
                                label: Text(tFullName),
                                prefixIcon: Icon(Icons.person_outline_rounded)),
                          ),
                          const SizedBox(height: tFormHeight - 20),
                          TextFormField(
                            controller: controller.email,
                            // initialValue: userData.email,
                            decoration: const InputDecoration(
                                label: Text(tEmail),
                                prefixIcon: Icon(Icons.email_outlined)),
                          ),
                          const SizedBox(height: tFormHeight - 20),
                          TextFormField(
                            controller: controller.phoneNo,
                            // initialValue: userData.phoneNo,
                            decoration: const InputDecoration(
                                label: Text(tPhoneNo),
                                prefixIcon: Icon(Icons.phone)),
                          ),
                          const SizedBox(height: tFormHeight - 20),
                          TextFormField(
                            controller: controller.password,
                            // initialValue: userData.password,
                            obscureText: true,
                            decoration:  InputDecoration(
                                label: const Text(tPassword),
                                prefixIcon: const Icon(Icons.fingerprint),
                                suffixIcon: IconButton(icon:const Icon(LineAwesomeIcons.eye_slash), onPressed: (){},),
                                ),
                          ),
                          const SizedBox(height: tFormHeight - 20),
                          TextFormField(
                            controller: controller.address,
                            // initialValue: userData.address,
                            decoration: const InputDecoration(
                                label: Text(" Your Address"),
                                prefixIcon: Icon(Icons.home_outlined)),
                          ),
                          const SizedBox(
                            height: tFormHeight,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                final userData = UserModel(
                                    email: controller.email.text.trim(),
                                    password: controller.password.text.trim(),
                                    fullName: controller.fullName.text.trim(),
                                    phoneNo: controller.phoneNo.text.trim(),
                                    address: controller.address.text.trim());
                                // await controller.updateRecord(userData);

                                // Get.to(() =>  UpdateProfileScreen()),
                              },
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
                            height: tFormHeight,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text.rich(TextSpan(
                                  text: joined,
                                  style: TextStyle(fontSize: 12),
                                  children: [
                                    TextSpan(
                                        text: joinedAt,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12)),
                                  ])),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.redAccent.withOpacity(0.1),
                                    elevation: 0,
                                    foregroundColor: Colors.red,
                                    shape: const StadiumBorder(),
                                    side: BorderSide.none,
                                  ),
                                  child: const Text(delete))
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
        ),
      ),
    );
  }
}
