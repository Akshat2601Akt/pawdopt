import 'package:pawdopt/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:pawdopt/screens/detailscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/pet_data.dart';

class CategoryBuilder extends StatefulWidget {
  final VoidCallback onPress;
  final String label;
  final String imageLink;
  final bool isAdopted;
  final int id;
  final int age;
  final String breed;
  final double price;
  final String colour;
  final String gender;
  final String about;
   const CategoryBuilder(
      {required this.onPress, required this.label, required this.imageLink, required this.isAdopted, required this.id, required this.age, required this.breed, required this.price, required this.colour, required this.gender, required this.about});

  @override
  State<CategoryBuilder> createState() => _CategoryBuilderState();
}

class _CategoryBuilderState extends State<CategoryBuilder> {
  SharedPreferences? preferences;
  var adopted = false;

  @override
  initState(){
    super.initState();
    setPreference();
  }

  setPreference() async {
   preferences  = await SharedPreferences.getInstance();
   adopted = preferences!.getBool("adoption${widget.id}") ?? allPets[widget.id].adopted;
   setState((){});
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: screenHeight * 0.315,
          width: screenWidth * 0.9,
          decoration: BoxDecoration(
              color: primaryColor6,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10.0,
                  spreadRadius: 0.002,
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                ),
              ]
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Hero(
                  tag: widget.label,
                  child: Stack(
                    children: [Image.asset(
                      widget.imageLink,
                      fit: BoxFit.fill,
                      width: double.maxFinite,
                      height: screenHeight * 0.25,
                      color: adopted ? Colors.grey.withOpacity(0.4) : null,
                      colorBlendMode: BlendMode.modulate,
                    ),
                      Positioned(
                        bottom: 10.0,
                          child: adopted ? Container(
                            color: Colors.white.withOpacity(0.8),
                            width: screenWidth * 0.9,
                            height: 20.0,
                            child: const Center(
                              child: Text('Already Adopted',
                              style: TextStyle(
                                color: primaryColor2,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.0
                              ),),
                            ),
                          ) : const SizedBox()
                      )
                      ]
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 0.0),
                      child: Wrap(
                          children: [
                            Text(
                              'Name: ${widget.label}',
                              style: TextStyle(
                                  fontFamily: 'Jua',
                                  fontSize: screenHeight * 0.025,
                                  fontWeight: FontWeight.w800,
                                  color: primaryColor1),
                            ),
                          ]),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProfileScreen(
                                    image: widget.imageLink,
                                    name: widget.label,
                                    id: widget.id,
                                    gender: widget.gender,
                                    price: widget.price,
                                    about: widget.about,
                                  age: widget.age,
                                    breed: widget.breed,
                                    colour: widget.colour,
                                    isAdopted: adopted,
                                  )),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'View Profile',
                            style: TextStyle(
                                fontFamily: 'Jua',
                                fontSize: screenHeight * 0.02,
                                fontWeight: FontWeight.w800,
                                color: primaryColor2),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16.0,
                            color: primaryColor2,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
