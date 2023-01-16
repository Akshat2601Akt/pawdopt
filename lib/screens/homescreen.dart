import '../constants/pet_data.dart';
import '../constants/pet_model.dart';
import '../widgets/category_builder.dart';
import '../widgets/footer_bar.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Pet> pets;
  late List<Pet> adoptedPets;
  String query = '';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pets = PetData().getAllPets();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 10.0,
        backgroundColor: primaryColor7,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        title: Text(
          ' PAWDOPT',
          style: TextStyle(
              fontFamily: 'Jua',
              fontSize: screenHeight * 0.031,
              fontWeight: FontWeight.w400,
              color: primaryColor6),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: SearchBar(
            text: query,
            onChanged: searchPet,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
          children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Text(
                  'Choose a category: ',
                  style: TextStyle(
                    fontFamily: 'Jua',
                    fontSize: screenHeight * 0.028,
                    fontWeight: FontWeight.w700,
                    color: primaryColor8,
                  ),
                ),
              ),
              ListView.builder(
                  itemCount: pets.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    final pet = pets[index];
                    return CategoryBuilder(
                        onPress: () {
                          Navigator.pushNamed(context, '/second');
                        },
                        label: pets[index].name,
                        imageLink: pets[index].image,
                        isAdopted: pets[index].adopted,
                        id: pets[index].id, gender:
                        pets[index].gender,
                        colour: pets[index].colour,
                        breed: pets[index].breed,
                        age: pets[index].age,
                        about: pets[index].about,
                        price: pets[index].price,
                          );
                  }
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: const FooterBar(),
    );
  }

  void searchPet(String query) {
    final pets = PetData().getAllPets().where((pet) {
      final nameLower = pet.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();

    setState((){
      this.query = query;
      this.pets = pets;
    });
  }
}
