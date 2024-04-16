import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';
import 'package:test_app/main.dart';
import 'package:test_app/src/Widgets/drawewrwidget.dart';
import 'package:test_app/src/features/authentication/screens/Rewards_screen/scratchScreen.dart';
import 'package:test_app/src/features/authentication/screens/welcome/complaints.dart';
import 'package:test_app/src/features/authentication/screens/welcome/home_screen.dart';

class AppUsageRewards extends StatefulWidget {
  const AppUsageRewards({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppUsageRewardsState();
}

class _AppUsageRewardsState extends State<AppUsageRewards> {
  ScrollController scrollController = ScrollController();
  bool colapsed = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        colapsed = (scrollController.offset > 130) ? true : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/reward.jpg",
            width: double.infinity,
            height: 290,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverAppBar(
                  foregroundColor: Colors.black,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  expandedHeight: 150,
                  elevation: 0.0,
                  pinned: true,
                  backgroundColor: Colors.green.shade50,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(
                      bottom: colapsed ? 16 : 8,
                      left: colapsed ? 50 : 10,
                    ),
                    title: (colapsed)
                        ? Text(
                            "Total Rewards: ${reviewList.length}",
                          )
                        : Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "You got\nTotal ${reviewList.length} Rewards",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                    background: Image.asset(
                      "assets/images/reward.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40)),
                        color: Colors.green.shade50),
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "My Rewards",
                          style: TextStyle(
                              fontSize: 25, fontStyle: FontStyle.italic),
                        ),
                        GridView.builder(
                          // itemCount: 10,
                          itemCount: reviewList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent:
                                MediaQuery.of(context).size.width / 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return cardItem(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cardItem(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScratchCardScreen()),
        );
      },
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset("assets/images/sratchImg.jpeg"),
        ),
      ),
    );
  }
}








// import 'package:flutter/material.dart';

// class AppUsageRewards extends StatefulWidget {
//   const AppUsageRewards({super.key});

//   @override
//   State<StatefulWidget> createState() => _AppUsageRewardsState();
// }

// class _AppUsageRewardsState extends State {
//   ScrollController scrollController = ScrollController();
//   bool colapsed = false;
//   @override
//   void initState() {
//     scrollController.addListener(() {
//       colapsed = (scrollController.offset > 130) ? true : false;
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: CustomScrollView(controller: scrollController, slivers: [
//       SliverAppBar(
//         foregroundColor: Colors.black,
//         leading: IconButton(
//           onPressed: () {},
//           icon: Icon(Icons.arrow_back),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.more_vert),
//           ),
//         ],
//         expandedHeight: 200,
//         elevation: 0.0,
//         pinned: true,
//         backgroundColor: Colors.green,
//         flexibleSpace: FlexibleSpaceBar(
//           titlePadding: EdgeInsets.only(
//             bottom: colapsed ? 16 : 8,
//             left: colapsed ? 50 : 10,
//           ),
//           title: (colapsed)
//               ? Text(
//                   "100 Coins Total Rewards",
//                   // style: TextStyle(color: Colors.black),
//                 )
//               : Text(
//                   "100 Coins\nTotal Rewards",
//                   style: TextStyle(color: Colors.black),
//                 ),
//           background: Image.asset(
//             "assets/reward2.3.jpg",
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//       SliverToBoxAdapter(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 "My Rewards",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25,
//                 ),
//               ),
//               GridView.builder(
//                   itemCount: 15,
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                     maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                   ),
//                   itemBuilder: (context, index) {
//                     return cardItem();
//                   })
//             ],
//           ),
//         ),
//       ),
//     ]));
//   }

//   Widget cardItem() {
//     return Container(
//       child: ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: Image.asset("assets/reward2.4.jpg")),
//     );
//   }
// }
