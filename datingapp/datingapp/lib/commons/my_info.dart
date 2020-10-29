import 'package:datingapp/commons/radial_progress.dart';
import 'package:datingapp/commons/rounded_img.dart';
import 'package:datingapp/styles/colors.dart';
import 'package:datingapp/styles/text_style.dart';
import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadialProgress(
            width: 4,
            goalCompleted: 0.9,
            child: RoundedImage(
              imagePath: 'assets/germ.jpg',
              size: Size.fromWidth(120.0),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Germy Louis",
                style: whiteNameTextStyle,
              ),
              Text(
                ", 24",
                style: whiteNameTextStyle,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.pin_drop,
                size: 15,
                color: hintTextColor,
              ),
              Text(
                '34 kilometers',
                style: whiteSubHeadingTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
