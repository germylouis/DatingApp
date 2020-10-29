import 'package:datingapp/styles/colors.dart';
import 'package:flutter/material.dart';

class OpaqueImage extends StatelessWidget {
  final imageUrl;

  const OpaqueImage({Key key, @required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          imageUrl,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Container(
          color: primaryColorOpacity.withOpacity(0.85),
        ),
      ],
    );
  }
}
