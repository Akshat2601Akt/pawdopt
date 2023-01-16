class Pet{
  final int id;
  final String name;
  final String breed;
  final int age;
  final String gender;
  final String about;
  final String colour;
  final String image;
  final double price;
  late bool adopted;

  Pet({
    required this.id,
    required this.name,
    required this.breed,
    required this.age,
    required this.gender,
    required this.about,
    required this.colour,
    required this.image,
    required this.price,
    required this.adopted
});

  factory Pet.fromJSon(Map<String, dynamic> json) => Pet(
      id: json['id'],
      name: json['name'],
      breed: json['breed'],
      age: json['age'],
      gender: json['gender'],
      about: json['about'],
      colour: json['colour'],
      image: json['image'],
      price: json['price'],
      adopted: json['adopted']);
}