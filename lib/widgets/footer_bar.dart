import 'package:flutter/material.dart';
import '../constants/constants.dart';

class FooterBar extends StatelessWidget {

  const FooterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
      height: 80.0,
      decoration: const BoxDecoration(
        color: primaryColor3,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/');
            },
            child: Text(
              'Home',
              style: TextStyle(
                fontFamily: 'PatrickHand',
                fontSize: screenHeight * 0.0305,
                fontWeight: FontWeight.w700,
                color: primaryColor6,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/second');
            },
            child: Text(
              'My Pets',
              style: TextStyle(
                fontFamily: 'PatrickHand',
                fontSize: screenHeight * 0.0305,
                fontWeight: FontWeight.w700,
                color: primaryColor6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
