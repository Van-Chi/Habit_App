import 'package:flutter/material.dart';

class ItemPageView extends StatelessWidget {
  const ItemPageView({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 350,
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xff573353),
              fontSize: 32,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        image,
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
