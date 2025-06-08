import 'package:flutter/material.dart';
import 'dart:math';
import 'package:circlemate/widgets/circle_list.dart';

class AvatarCircleMenu extends StatefulWidget {
  @override
  _AvatarCircleMenuState createState() => _AvatarCircleMenuState();
}

class _AvatarCircleMenuState extends State<AvatarCircleMenu> {
  final List<String> imgPaths = [
    'images/avators/ImgAvatorMale-1.png',
    'images/avators/ImgAvatorFemale-1.png',
    'images/avators/ImgAvatorMale-2.png',
    'images/avators/ImgAvatorFemale-2.png',
    'images/avators/ImgAvatorMale-3.png',
    'images/avators/ImgAvatorFemale-3.png',
    'images/avators/ImgAvatorMale-4.png',
    'images/avators/ImgAvatorFemale-4.png',
    'images/avators/ImgAvatorMale-5.png',
    'images/avators/ImgAvatorFemale-5.png',
    'images/avators/ImgAvatorMale-6.png',
    'images/avators/ImgAvatorFemale-6.png',
    'images/avators/ImgAvatorMale-7.png',
    'images/avators/ImgAvatorFemale-7.png',
    // 'images/avators/ImgAvatorMale-8.png',
    // 'images/avators/ImgAvatorFemale-8.png',
    // 'images/avators/ImgAvatorMale-9.png',
    // 'images/avators/ImgAvatorFemale-9.png',
    // 'images/avators/ImgAvatorMale-10.png',
    // 'images/avators/ImgAvatorFemale-10.png',
  ];

  String selectedImagePath = '';
  double selectedSize = 70.0;
  double unselectedSize = 50.0;


  @override
  void initState() {
    super.initState();
    selectedImagePath = imgPaths.first;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body:Stack(
        children: [
          // Container(
          //   width: 200,
          //   color: Colors.grey[200], // Optional background color
          //     ),
          // // ),

          // Right half with CircleList
          Positioned(
            top: screenHeight * 0.3,
            left: screenWidth * 0.35, //mobile:190.0 and Pc:
            child: Container(
              alignment: Alignment.centerLeft, // Align to left within right half
              child: CircleList(
                outerRadius: screenWidth * 0.5,
                innerRadius: screenWidth * 0.2,
                innerCircleColor: Colors.white.withOpacity(0.1),
                outerCircleColor: Colors.blue.withOpacity(0.1),
                origin: Offset(0,0),
                children: imgPaths.sublist(0,min(10, imgPaths.length)).map((path) => GestureDetector(
                  onTap: () => setState(() => selectedImagePath = path),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40), // Must match ClipRRect
                      border: Border.all(
                        color: Colors.blue, // Border color
                        width:  selectedImagePath == path ? 3.0 : 0,       // Border width
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Same radius as container
                      child: Image.asset(
                        path,
                        width: selectedImagePath == path ? selectedSize : unselectedSize,
                        height: selectedImagePath == path ? selectedSize : unselectedSize,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
                ).toList(),
                centerWidget: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    selectedImagePath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


