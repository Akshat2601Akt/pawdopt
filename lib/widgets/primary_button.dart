import 'package:flutter/material.dart';
import '../constants/constants.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPress;
  final String label;
  final bool active;
  const PrimaryButton({required this.onPress, required this.label, required this.active});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.054,
      width: screenWidth * 0.841,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: active ? primaryColor1 : primaryColor1.withOpacity(0.5),
      ),
      child: Center(
        child: GestureDetector(
          onTap: onPress,
          child: Text(
            label,
            style: TextStyle(
                fontFamily: 'Jua',
                fontSize: screenHeight * 0.026,
                fontWeight: FontWeight.w800,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
