import 'package:flutter/material.dart';

class CustomButton extends  StatelessWidget {
   CustomButton({
    Key? key,
  this.wide=double.infinity,
    this.background=Colors.deepPurple,
    required this.function,
    required this.text
  });
  double wide = double.infinity;
      Color background = Colors.deepPurple;
   VoidCallback function;
   String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: wide,
      color: background,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
