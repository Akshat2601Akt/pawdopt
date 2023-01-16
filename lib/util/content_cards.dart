import 'package:flutter/material.dart';

class ContentCards extends StatelessWidget {
  final Widget childWidget;

  const ContentCards({Key? key, required this.childWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5.0,
              spreadRadius: 0.002,
              color: Color.fromRGBO(0, 0, 0, 0.25),
            ),
          ]),
      child: childWidget,
    );
  }
}
