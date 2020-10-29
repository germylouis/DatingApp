import 'package:datingapp/commons/my_info.dart';
import 'package:datingapp/commons/opaque_imaage.dart';
import 'package:datingapp/commons/profile_info_bgcard.dart';
import 'package:datingapp/sceens/super_likes.dart';
import 'package:datingapp/styles/colors.dart';
import 'package:datingapp/styles/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final UserCredential userCred;
  final User user;
  Profile({Key key, this.userCred, this.user}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    OpaqueImage(
                      imageUrl: 'assets/germ.jpg',
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'My Profile',
                                textAlign: TextAlign.left,
                                style: headingTextStyle,
                              ),
                            ),
                            MyInfo(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  color: hintTextColor,
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          ProfileInfoBigCard(
                            firstText: '13',
                            secondText: 'New Matches',
                            icon: Icon(
                              Icons.thumb_up,
                              color: blueColor,
                            ),
                          ),
                          ProfileInfoBigCard(
                            firstText: '21',
                            secondText: 'Unmatched me',
                            icon: Icon(
                              Icons.sentiment_dissatisfied,
                              color: blueColor,
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          ProfileInfoBigCard(
                            firstText: '264',
                            secondText: 'Total Matches',
                            icon: Icon(
                              Icons.done_all_outlined,
                              color: blueColor,
                            ),
                          ),
                          ProfileInfoBigCard(
                            firstText: '42',
                            secondText: 'Rematches',
                            icon: Icon(
                              Icons.refresh,
                              color: blueColor,
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          ProfileInfoBigCard(
                            firstText: '404',
                            secondText: 'Profile Visitors',
                            icon: Icon(
                              Icons.visibility,
                              color: blueColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SuperLikesMePage(),
                                ),
                              );
                            },
                            child: ProfileInfoBigCard(
                              firstText: '42',
                              secondText: 'Super Likes',
                              icon: Icon(
                                Icons.star,
                                color: blueColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
