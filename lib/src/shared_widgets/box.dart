import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final String? label;
  final Color? bgColour;
  const CustomBox({
    Key? key,
    required this.label,
    required this.bgColour
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      width: 120,
      height: 200,
      color: bgColour,
      alignment: Alignment.center,
      child: Text(label ?? "", style: const TextStyle(
        color: Colors.black45,
        fontSize: 24
      ),),
    );
  }
}
