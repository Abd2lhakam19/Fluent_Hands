import 'package:fluent_hands/core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class ContentScreen extends StatelessWidget {
  ContentScreen(
      {super.key, required this.word, required this.des, required this.img});
  String word;
  String des;
  String img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              "http://arslapp.runasp.net$img",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            word,
            style: TextStyles.bold24BlueBerry,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              des,
              style: TextStyles.regular16BlueBerry,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
