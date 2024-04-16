import 'package:flutter/material.dart';
import 'package:test_app/src/constants/image_strings.dart';
import 'package:test_app/src/constants/text_strings.dart';

class FormHeaderWidget extends StatelessWidget{
  const FormHeaderWidget({super.key,
  this.imageColor,
  this.heightBetween,
  required this.image,
  required this.title,
  required this.subTitle,
  this.imageHeight =0.2,
  this.textAlign,
  this.crossAxisAlignment =CrossAxisAlignment.start,
  
  });
final Color? imageColor;
final double imageHeight;
final double? heightBetween;
final String image;
final String title;
final String subTitle;
final CrossAxisAlignment crossAxisAlignment;
final TextAlign? textAlign;
@override
  Widget build(BuildContext context){
    final size=MediaQuery.of(context).size;
    return Column(

      children: [
        Image(image: AssetImage(image), color: imageColor, height: size.height * imageHeight),
        SizedBox(height: heightBetween),
        Text(title, style: Theme.of(context).textTheme.headlineLarge),
        Text(subTitle, textAlign: textAlign, style: Theme.of(context).textTheme.bodyLarge),

        
      ],);
  }
}