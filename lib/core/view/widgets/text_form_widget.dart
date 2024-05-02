import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class TextFormWidget extends StatefulWidget {
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  TextFormWidget(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.validator,
      required this.controller,
      this.keyboardType});

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  String text = '';

  bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: double.infinity,
        // height: 60,
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textDirection: isRTL(text) ? TextDirection.rtl : TextDirection.ltr,
          onChanged: (value) {
            if (value.length == 1) {
              setState(() {
                text = value;
                print('update');
              });
            }
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            hintText: widget.hintText,
            labelText: widget.labelText,
            //hintStyle: TextStyle(fontSize: 15),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
          validator: widget.validator,
        ),
      ),
    );
  }
}
