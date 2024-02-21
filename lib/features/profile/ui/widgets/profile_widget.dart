import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileWidget extends StatelessWidget {
  String label;
  String details;

  ProfileWidget({super.key, required this.details, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: Text(label, textAlign : TextAlign.start, style: TextStyle(color: Color(0xff6B6B6B)),)),
        Expanded(flex: 3, child: Text(details, maxLines: 1, overflow: TextOverflow.ellipsis)),
        Icon(Icons.arrow_forward_ios_sharp),
      ],
    );
  }
}
