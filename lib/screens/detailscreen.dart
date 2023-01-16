import 'package:flutter/material.dart';
import 'package:pawdopt/constants/pet_data.dart';
import 'package:pawdopt/widgets/individual_details.dart';
import 'package:pawdopt/widgets/primary_button.dart';
import 'package:pawdopt/widgets/profile_card.dart';
import '../constants/constants.dart';
import '../constants/pet_data.dart';
import '../widgets/footer_bar.dart';
import 'package:confetti/confetti.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  final int id;
  final int age;
  final String breed;
  final String image;
  final String name;
  final double price;
  final String colour;
  final String gender;
  final String about;
  final bool isAdopted;
  const ProfileScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.id,
      required this.age,
      required this.breed,
      required this.price,
      required this.colour,
      required this.gender,
      required this.about,
      required this.isAdopted})
      : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isPlaying = false;
  final controller = ConfettiController();
  late SharedPreferences preferences;
  @override
  void initState() {
    init();
    super.initState();
    controller.addListener(() {
      setState(() {
        isPlaying = controller.state == ConfettiControllerState.playing;
      });
    });
  }

  Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future setStatus() async {
    final bool? isAdopted = preferences.getBool('adoption${widget.id}');
    if (isAdopted == null) return;
    setState(() => allPets[widget.id].adopted = isAdopted);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        backgroundColor: primaryColor7,
        leading: GestureDetector(
            onTap: () => Navigator.popAndPushNamed(context, '/'),
            child: const Icon(Icons.arrow_back_ios_rounded)),
        title: Text(
          ' PAWDOPT',
          style: TextStyle(
              fontFamily: 'Jua',
              fontSize: screenHeight * 0.031,
              fontWeight: FontWeight.w400,
              color: primaryColor6),
        ),
      ),
      body: Stack(alignment: Alignment.topCenter, children: [
        ListView(
          children: [
            ProfileCard(
                age: widget.age,
                breed: widget.breed,
                image: widget.image,
                name: widget.name,
                gender: widget.gender),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            IndividualDetails(
                age: widget.age,
                breed: widget.breed,
                price: widget.price,
                colour: widget.colour,
                gender: widget.gender,
                about: widget.about),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: PrimaryButton(
                  active: !widget.isAdopted,
                  label: widget.isAdopted ? 'Already Adopted' : 'Adopt Me!',
                  onPress: widget.isAdopted
                      ? () {}
                      : () async {
                          await preferences.setBool(
                              'adoption${widget.id}', true);
                          setStatus();
                          controller.play();
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              backgroundColor: primaryColor6,
                              title: const Text('Pawsome!'),
                              titleTextStyle: TextStyle(
                                fontFamily: 'Jua',
                                fontSize: screenHeight * 0.028,
                                fontWeight: FontWeight.w700,
                                color: primaryColor8,
                              ),
                              alignment: Alignment.center,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              content:
                                  Text('You\'ve now adopted ${widget.name}'),
                              contentTextStyle: TextStyle(
                                fontFamily: 'PatrickHand',
                                fontSize: screenHeight * 0.024,
                                fontWeight: FontWeight.w700,
                                color: primaryColor8,
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    controller.stop();
                                    Navigator.popAndPushNamed(context, '/');
                                  },
                                  child: Text(
                                    'Back to Home Screen',
                                    style: TextStyle(
                                      fontFamily: 'PatrickHand',
                                      fontSize: screenHeight * 0.024,
                                      fontWeight: FontWeight.w700,
                                      color: primaryColor3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
            ),
            const SizedBox(
              height: 70.0,
            ),
          ],
        ),
        ConfettiWidget(
          confettiController: controller,
          shouldLoop: true,
          numberOfParticles: 20,
          blastDirectionality: BlastDirectionality.explosive,
          gravity: 0.4,
        ),
        const Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: FooterBar(),
        )
      ]),
    );
  }
}
