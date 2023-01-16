import 'package:flutter/material.dart';
import '../util/content_cards.dart';
import '../util/category_content_display.dart';

class IndividualDetails extends StatelessWidget {
  final int age;
  final String breed;
  final double price;
  final String colour;
  final String gender;
  final String about;
  const IndividualDetails({Key? key, required this.age, required this.breed, required this.price, required this.colour, required this.gender, required this.about}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          ContentCards(
            childWidget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'About',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'NunitoBold',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    about,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'NunitoRegular',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ContentCards(
            childWidget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Personal Details',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'NunitoBold',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  CategoryContentDisplay(
                      categoryName: 'Breed',
                      categoryContent: breed),
                  CategoryContentDisplay(
                      categoryName: 'Colour',
                      categoryContent: colour),
                  CategoryContentDisplay(
                      categoryName: 'Age',
                      categoryContent: '${age.toString()} Years'),
                  CategoryContentDisplay(
                      categoryName: 'Gender',
                      categoryContent: gender),
                  CategoryContentDisplay(
                      categoryName: 'Price',
                      categoryContent: '₹${price.toInt().toString()}'),
                  const SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
