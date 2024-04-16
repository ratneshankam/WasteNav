import 'package:flutter/material.dart';
import 'package:test_app/src/Widgets/AppBarWidget.dart';
import 'package:test_app/src/Widgets/drawewrwidget.dart';
import 'package:test_app/src/Widgets/featurewidget.dart';
import 'package:test_app/src/Widgets/scrollImages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      // backgroundColor: Colors.green.shade50,
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.green,
      //   automaticallyImplyLeading: false,
      // ),

      // body starts
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          
          // carousel feature
          ScrollImages(),


          //Landing page features
          Expanded(
            child: ListView(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    "Features",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),

                //feture widget
                FeatureWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
