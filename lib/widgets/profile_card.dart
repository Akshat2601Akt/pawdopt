import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final int age;
  final String breed;
  final String image;
  final String name;
  final String gender;
  const ProfileCard({Key? key, required this.age, required this.breed, required this.image, required this.name, required this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(
          height: screenHeight * 0.42,
          width: screenWidth,
          child: Card(
            margin: const EdgeInsets.all(0),
            child: Hero(
              tag: name,
              child: Image(
                width: screenWidth,
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: Container(
            color: Colors.black45,
            height: 70.0,
            width: screenWidth,
            padding: EdgeInsets.only(left: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '$name, 25',
                      style: const TextStyle(
                        fontFamily: 'Jua',
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  '$gender • $breed ',
                  style: const TextStyle(
                    fontFamily: 'PatrickHand',
                    fontSize: 22.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
