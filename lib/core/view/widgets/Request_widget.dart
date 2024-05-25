import 'package:flutter/material.dart';

class RequestWidget extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String subtitle;
  final Function() onPressed;

  const RequestWidget(
      {required this.text,
      required this.imageUrl,
      required this.subtitle,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: onPressed,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 75,
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.5),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(10, 20),
                    blurRadius: 10,
                    spreadRadius: 0,
                    color: Colors.grey.withOpacity(.05)),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(child: Icon(Icons.person),),
                // Image.network(imageUrl, height: 59, fit: BoxFit.cover),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(text,
                      // textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                ),
                    const SizedBox(
                  width: 15,
                ),
                // const Spacer(),
                Expanded(
                  child: Text(
                    subtitle,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}