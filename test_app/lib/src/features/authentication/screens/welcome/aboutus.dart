import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // App Icon and Title
          Center(
            child: Image.asset(
              'assets/images/logo_color.png', // Replace with your app icon
              height: 200,
              width: 200,
            ),
          ),
          Text(
            'WasteNav: Simplifying Waste Disposal in Rural Areas',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 10),

          // Text Description with Line Breaks
          Text(
            '\t\t\t\t\t\tWasteNav is a mobile application built using Flutter, a cross-platform development framework, designed to automate and streamline waste disposal in rural areas.\n\n'
            '\t\t\t\t\t\tWe address the challenge of manual waste collection by leveraging Google Maps integration. This allows garbage collectors to efficiently track user locations and send timely notification alerts when they arrive for pickup.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),

          // Feature List with Icons
          SizedBox(height: 20),
          Text(
            'Our Key Features:',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.location_on, color: Colors.green),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  'Automated Waste Collection with Google Maps',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.notifications, color: Colors.blue),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  'Real-time Arrival Notifications',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.report_problem, color: Colors.orange),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  'Complaint Registration & Reward System',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.place, color: Colors.purple),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  'Manual Disposal Point Locator',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),

          // Team and Contact (Consider adding if applicable)
          SizedBox(height: 20),
          Text(
            'The WasteNav Team:',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 10),
          Text(
            '\t\tWe are a passionate group of developers committed to creating innovative solutions for sustainable waste management in rural communities.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 10),
          Text(
            '💻 Ratnesh Ankam\n'
            '💻 Dnyaneshwar Pingale\n'
            '💻 Ajay Pawar\n',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Contact us:',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 20),
              IconButton(
                iconSize: 35,
                color: Colors.blue,
                icon: const Icon(Icons.phone),
                onPressed: _launchTel,
              ),
              const SizedBox(width: 20),
              IconButton(
                iconSize: 35,
                color: Colors.red.shade400,
                icon: const Icon(Icons.email),
                onPressed: _launchEmail,
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: _launchGitlab,
                child: SvgPicture.asset(
                  'assets/images/gitlab.svg', // Replace with your image path
                  height: 35, // Set the desired height
                  width: 35, // Set the desired width
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              'Made with love ❤️',
              style: TextStyle(
                fontStyle: FontStyle.italic, // Italic for a touch
              ),
            ),
          ),
        ],
      ),
    )));
  }

  final String _flutterGeneratorEmail = 'fluttergenerator@gmail.com';
  final String _phoneNumber = '1234567890';

  void _launchTel() async {
    final url = Uri.parse('tel:$_phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch email app';
    }
  }

  void _launchEmail() async {
    final url = Uri.parse('mailto:$_flutterGeneratorEmail');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch email app';
    }
  }

  void _launchGitlab() async {
    final url = Uri.parse('https://gitlab.com/flutterapp1/waste-navigator');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch email app';
    }
  }
}
