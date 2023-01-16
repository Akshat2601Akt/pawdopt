import 'package:flutter/material.dart';

class CategoryContentDisplay extends StatelessWidget {
  final String categoryName;
  final String categoryContent;

  const CategoryContentDisplay(
      {required this.categoryName, required this.categoryContent});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              minWidth: screenWidth * 0.42,
            ),
            child: Text(
              categoryName,
              style: const TextStyle(
                fontFamily: 'NunitoBold',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Color(0xff94A3B8),
              ),
            ),
          ),
          const Text(
            ': ',
            style: TextStyle(
              fontFamily: 'NunitoBold',
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          Flexible(
            child: Text(
              categoryContent,
              style: const TextStyle(
                fontFamily: 'NunitoBold',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
