import 'package:flutter/material.dart';
import 'package:test_app/src/constants/image_strings.dart';
import 'package:test_app/src/constants/text_strings.dart';
import 'package:test_app/src/features/authentication/models/model_on_boarding.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.model,
  });
  final OnBoardingModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: model.bgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            //  color: Colors.amber,
            child: Image(
              image: AssetImage(
                model.image,
              ),
              fit: BoxFit.cover,
              height: model.height * 0.5,
              // width: double.infinity,
            ),
          ),
          Column(
            children: [
              Text(
                model.title,
                style: Theme.of(context).textTheme.headlineLarge,
                // style: TextStyle(
                //   fontSize: 20,
                //   fontWeight: FontWeight.bold,
                //   fontStyle: FontStyle.normal,

                // ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  model.subTitle,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                model.counterText,
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}
