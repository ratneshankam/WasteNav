import 'package:flutter/material.dart';
import 'package:test_app/src/Widgets/drawewrwidget.dart';
import 'package:test_app/src/features/authentication/screens/welcome/complaints.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<bool> isLikedList = List.filled(8, false);
  List<bool> isBookmarkedList = List.filled(8, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   automaticallyImplyLeading: false,
      //   title: ShaderMask(
      //     shaderCallback: (Rect bounds) {
      //       return const LinearGradient(
      //         colors: [Colors.black, Colors.green],
      //         begin: Alignment.topCenter,
      //         end: Alignment.bottomCenter,
      //       ).createShader(bounds);
      //     },
      //     child: const Text(
      //       'Posts',
      //       style: TextStyle(
      //         fontSize: 36.0,
      //         fontWeight: FontWeight.bold,
      //         color:
      //             Colors.white, // This color will be ignored due to ShaderMask
      //       ),
      //     ),
      //   ),
      // ),

      // endDrawer: DrawerWidget(),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: GestureDetector(
                      onDoubleTap: () {
                        setState(() {
                          isLikedList[index] = !isLikedList[index];
                        });
                      },
                      child: Container(
                        child: Image.asset(
                          "assets/images/waste_post/waste_post${index + 1}.jpg",
                          width: double.infinity,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                      ),
                    )),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isLikedList[index] = !isLikedList[index];
                        });
                      },
                      icon: isLikedList[index]
                          ? const Icon(
                              Icons.favorite_rounded,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_outline_outlined,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ComplaintPage()));
                      },
                      icon: const Icon(
                        Icons.comment_outlined,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isBookmarkedList[index] = !isBookmarkedList[index];
                        });
                      },
                      icon: isBookmarkedList[index]
                          ? const Icon(
                              Icons.bookmark_added,
                              color: Colors.blueAccent,
                            )
                          : const Icon(
                              Icons.bookmark_add_outlined,
                            ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
