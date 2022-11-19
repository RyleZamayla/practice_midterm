import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom extends StatelessWidget {
  final title;
  final data;
  const Custom({ required this.data, required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50,
          child: Text(title.toString()),
        ),
        const VerticalDivider(
          width: 75,
        ),
        SizedBox(
          height: 50,
          child: Text(data.toString()),
        ),
      ],
    );
  }
}
