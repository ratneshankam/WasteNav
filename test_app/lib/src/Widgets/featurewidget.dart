import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/src/features/authentication/screens/Rewards_screen/rewards.dart';
import 'package:test_app/src/features/authentication/screens/welcome/complaints.dart';
import 'package:test_app/src/features/authentication/screens/welcome/location_page.dart';

class FeatureWidget extends StatelessWidget {
  const FeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              //single feature
              // for(int i=0; i<3; i++)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: InkWell(
                  onTap: () async {
                    reviewList = await getreviewData();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ComplaintPage()));
                  },
                  child: Container(
                    width: 160,
                    height: 225,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            offset: const Offset(3, 0),
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/images/complaintImg.jpg",
                              // width: 170,
                              height: 130,
                            ),
                          ),
                          const Text(
                            "Complaints",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AppUsageRewards()));
                  },
                  child: Container(
                    width: 160,
                    height: 225,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            offset: const Offset(3, 0),
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset("assets/images/Rewards.png",
                                // width: 225,
                                height: 130),
                          ),
                          const Text(
                            "Rewards",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 7, horizontal: 8),
              //   child: InkWell(
              //     onTap: (){},
              //     child: Container(
              //       width: 330,
              //       height: 225,
              //       decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(10),
              //           boxShadow: [
              //             BoxShadow(
              //               color: Colors.grey.withOpacity(0.5),
              //               spreadRadius: 4,
              //               offset: Offset(3,0),
              //             ),
              //           ]),
              //       child: Padding(
              //         padding: EdgeInsets.symmetric(horizontal: 10),
              //         child: Column(
              //           children: [
              //             Container(
              //               child: Image.asset(
              //                 "assets/images/disposal1.jpg",
              //                 width: 225,
              //                 height: 170,
              //               ),
              //             ),
              //             Text(
              //               "Nearest Disposal",
              //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 330,
              height: 225,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      offset: Offset(3, 0),
                    ),
                  ]),
              child: InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LocationPage())),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/images/disposal1.jpg",
                          width: 225,
                          height: 170,
                        ),
                      ),
                      const Text(
                        "Nearest Disposal",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
