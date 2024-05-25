
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FadeAppBar extends StatelessWidget {
  final double scrollOffset;
  Function(String)? onChanged;
  FadeAppBar({Key? key, required this.scrollOffset, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Container(
          height: 100,
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 24.0,
          ),
          color: Colors.white
              .withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
          child: SafeArea(
              child: SearchInput(
            onChanged: onChanged,
          )),
        ));
  }
}

// ignore: must_be_immutable
class SearchInput extends StatelessWidget {
  Function(String)? onChanged;
  SearchInput({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1)),
        ]),
        child: TextField(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
          decoration: InputDecoration(
            // prefixIcon: Icon(Icons.email),
            prefixIcon: Icon(Icons.search, size: 20, color: Color(0xffFF5A60)),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Where are you going?',
            // hintStyle: TextStyle(color: Colors.black.withOpacity(.75)),
            contentPadding:
                EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
          onChanged: onChanged,
        ));
  }
}
