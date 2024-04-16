// List<BottomSheetModel> cardList = [
//   BottomSheetModel(
//       title: "Creating Disposal",
//       description: "Complaint for create waste disposal near ambegaon",
//       date: "3/2/2022"),
//   BottomSheetModel(
//       title: "Cleaning Vadgaon",
//       description:
//           "Rise complaint for Cleaning rodeside waste in the vadgaon",
//       date: "3/2/2022"),
// ];
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
// import 'package:todolist_app/advancetodobysir.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:test_app/src/features/authentication/screens/welcome/database.dart';

List<ReviewModel> reviewList = [];
double? starsRating = 0;

// insert
Future<void> insertreviewData(ReviewModel obj) async {
  final localDB = await database;

  await localDB.insert("ReviewData", obj.todoMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

// fetch data
Future<List<ReviewModel>> getreviewData() async {
  final localDB = await database;

  List<Map<String, dynamic>> reviewMap = await localDB.query("ReviewData");
  print("INSIDE MAP: $reviewMap");
  return List.generate(reviewMap.length, (i) {
    return ReviewModel(
      reviewId: reviewMap[i]['reviewId'],
      title: reviewMap[i]['title'],
      description: reviewMap[i]['description'],
      stars: reviewMap[i]['stars'],
      // date: reviewMap[i]['date'],
    );
  });
}

// delete
Future<void> deletereviewData(int? data) async {
  final localDB = await database;
  print("what is data...........$data");
  await localDB.delete(
    "ReviewData",
    where: "reviewId = ?",
    whereArgs: [data],
  );
}

// update
Future<void> updatereviewData(ReviewModel obj) async {
  final localDB = await database;
  await localDB.update(
    "ReviewData",
    obj.todoMap(),
    where: "reviewId = ?",
    whereArgs: [obj.reviewId],
  );
}

class ReviewModel {
  final int? reviewId;
  String? title;
  String? description;
  double? stars;

  ReviewModel({this.reviewId, this.title, this.description, this.stars});

  Map<String, dynamic> todoMap() {
    return {
      "reviewId": reviewId,
      "title": title,
      "description": description,
      "stars": stars,
    };
  }

  @override
  String toString() {
    return """{reviewId : $reviewId, title : $title, description : $description, stars : $stars}""";
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ComplaintPage(),
    );
  }
}

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});
  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  ///Text Editing Controllers
  // final TextEditingController dateController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void clearControllers() {
    titleController.clear();
    descriptionController.clear();
    // dateController.clear();
  }

  void submit(bool doEdit, [ReviewModel? obj]) async {
    if (titleController.text.trim().isNotEmpty &&
            descriptionController.text.trim().isNotEmpty

        // dateController.text.trim().isNotEmpty
        ) {
      if (!doEdit) {
        setState(() {
          insertreviewData(ReviewModel(
              title: titleController.text.trim(),
              description: descriptionController.text.trim(),
              stars: starsRating));

          reviewList.add(ReviewModel(
            title: titleController.text.trim(),
            description: descriptionController.text.trim(),
            stars: starsRating,
            // date: dateController.text.trim()
          ));
        });
        reviewList = await getreviewData();
        print("After Insertion: ${await getreviewData()}");
      } else {
        setState(() {
          obj!.title = titleController.text.trim();
          obj.description = descriptionController.text.trim();
          // obj.date = dateController.text.trim();
        });
      }
    }
  }

  void editEntry(ReviewModel obj) async {
    titleController.text = obj.title!;
    descriptionController.text = obj.description!;
    // dateController.text = obj.date!;
    updatereviewData(obj);
    print("After update:  ${await getreviewData()}");

    showBottomSht(true, obj);
  }

  void deleteEntry(ReviewModel obj) async {
    setState(() {
      reviewList.remove(obj);
      deletereviewData(obj.reviewId);
    });
    print("After delete:  ${await getreviewData()}");
  }

  Future<void> showBottomSht(bool doEdit, [ReviewModel? ReviewModelObj]) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Add Review",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: TextStyle(
                        color: const Color.fromRGBO(129, 199, 132, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: "Enter Title",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(129, 199, 132, 1),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Description",
                      style: TextStyle(
                        color: const Color.fromRGBO(129, 199, 132, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextFormField(
                      controller: descriptionController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: "Enter Review",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(129, 199, 132, 1),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Rating",
                      style: TextStyle(
                        color: const Color.fromRGBO(129, 199, 132, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        starsRating = rating;
                        print(rating);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 300,
                margin: const EdgeInsets.all(10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        13,
                      ),
                    ),
                    backgroundColor: const Color.fromRGBO(129, 199, 132, 1),
                  ),
                  onPressed: () async {
                    doEdit ? submit(doEdit, ReviewModelObj) : submit(doEdit);

                    Navigator.pop(context);
                    reviewList = await getreviewData();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Inside buildcontext $reviewList");
    return Scaffold(
      backgroundColor: Color.fromRGBO(129, 199, 132, 1),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "👋Hello,",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "User",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 35,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(
                      40,
                    ),
                  ),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "COMPLAINT/REVIEWS",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 30),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(
                              40,
                            ),
                          ),
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: reviewList.length,
                          itemBuilder: (context, index) {
                            return Slidable(
                              // closeOnScroll: true,
                              endActionPane: ActionPane(
                                extentRatio: 0.2,
                                motion: const DrawerMotion(),
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        GestureDetector(
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                          onTap: () {
                                            editEntry(reviewList[index]);
                                          },
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        GestureDetector(
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                          onTap: () {
                                            deleteEntry(reviewList[index]);
                                          },
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              key: ValueKey(index),
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  bottom: 20,
                                  top: 20,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  border: Border.all(
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.05),
                                      width: 0.5),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 20,
                                      color: Color.fromRGBO(0, 0, 0, 0.13),
                                    )
                                  ],
                                  borderRadius:
                                      const BorderRadius.all(Radius.zero),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Row(
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 70,
                                            height: 70,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                      "assets/images/Avtar.jpg",
                                                    ))),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    reviewList[index].title!,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              SizedBox(
                                                width: 250,
                                                child: Text(
                                                  reviewList[index]
                                                      .description!,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    size: 18,
                                                    color: Colors.amber,
                                                  ),
                                                  Text(
                                                    "${reviewList[index].stars}",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(129, 199, 132, 1),
        onPressed: () async {
          clearControllers();
          await showBottomSht(false);
        },
        child: Container(
          child: Text(
            "Add+",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
