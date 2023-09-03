import 'package:flutter/material.dart';

import '../constants/constant.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          color: color??Theme.of(context).primaryColor,
          // color: rubyRed,
          borderRadius: BorderRadius.circular(10.0),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 2,
          //     blurRadius: 5,
          //     offset: Offset(0, 3),
          //   ),
          // ],
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
