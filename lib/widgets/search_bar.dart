import 'package:flutter/material.dart';
import '../constants/constants.dart';

class SearchBar extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;

  const SearchBar({Key? key, required this.text, required this.onChanged})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}
  class _SearchBarState extends State<SearchBar> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          decoration: BoxDecoration(
            color: primaryColor5,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              icon: const Icon(
                Icons.search_rounded,
                color: primaryColor1,
                size: 25.0,
              ),
              suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                child: const Icon(
                    Icons.close_rounded,
                    color: primaryColor1,
                  size: 25.0
                ),
                onTap: () {
                  controller.clear();
                  widget.onChanged('');
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              )
                  : null,
              border: InputBorder.none,
              hintText: 'Search here...',
              hintStyle: const TextStyle(
                fontFamily: 'PatrickHand',
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: primaryColor1,
              )
            ),
            onChanged: widget.onChanged,
            style: const TextStyle(
              fontFamily: 'PatrickHand',
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: primaryColor1,
            ),
          ),
        ),
    );
  }
}
