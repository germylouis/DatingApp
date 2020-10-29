import 'dart:core';

import 'package:flutter/material.dart';

class AppUser {
  final String fName;
  final String lName;
  final String profilePic;
  final String occupation;
  final String school;
  final String location;
  final int age;

  AppUser(
      {@required this.fName,
      @required this.lName,
      @required this.age,
      this.profilePic,
      this.location,
      this.occupation,
      this.school});
}
