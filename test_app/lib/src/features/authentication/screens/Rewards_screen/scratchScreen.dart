import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';
import 'package:test_app/main.dart';
import 'package:test_app/src/features/authentication/screens/welcome/home_screen.dart';
import 'package:test_app/src/features/authentication/screens/welcome/landing_page.dart';

class ScratchCardScreen extends StatefulWidget {
  const ScratchCardScreen({super.key});

  @override
  State<ScratchCardScreen> createState() => _ScratchCardScreenState();
}

class _ScratchCardScreenState extends State<ScratchCardScreen> {
  final GlobalKey<ScratcherState> _scratcherKey = GlobalKey<ScratcherState>();
  bool isScratched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scratch Card'),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (!isScratched) {
              _scratcherKey.currentState!.canScratch;
            }
          },
          child: Stack(
            children: [
              Scratcher(
                key: _scratcherKey,
                brushSize: 40,
                threshold: 50,
                color: Colors.transparent, // Set color to transparent
                image: Image.asset("assets/images/sratchImg.jpeg"),
                onChange: (value) {
                  if (value > 50) {
                    setState(() {
                      isScratched = true;
                      
                    });
                  }
                },
                child: const SizedBox(
                  height: 250,
                  width: 250,
                ),
              ),
              if (isScratched)
                Positioned.fill(
                  child: SizedBox(
                    height: 250,
                  width: 250,
                    child: Center(
                      child: Image.asset("assets/images/sratchInside.jpg"),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:scratcher/scratcher.dart';

// class ScratchCardScreen extends StatefulWidget {
//   @override
//   _ScratchCardScreenState createState() => _ScratchCardScreenState();
// }

// class _ScratchCardScreenState extends State<ScratchCardScreen> {
//   GlobalKey<ScratcherState> _scratcherKey = GlobalKey<ScratcherState>();
//   bool isScratched = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scratch Card'),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onTap: () {
//             if (!isScratched) {
//               _scratcherKey.currentState!.checked;
//             }
//           },
//           child: Scratcher(
//             key: _scratcherKey,
//             brushSize: 40,
//             threshold: 50,
//             color: Colors.grey,
//             onThreshold: () {
//               setState(() {
//                 isScratched = false;
//               });
//             },
//             child: isScratched
//                 ? ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.asset("assets/rewards2.2.jpg"),
                    
//                   )
//                 : ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.asset("assets/reward2.4.jpg"),
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }
