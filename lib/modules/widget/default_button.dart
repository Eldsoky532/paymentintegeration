import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  Widget buttonWidget;
  Function() function;
  double width;
  Color background;
  bool isUpperColor;
  double radius;
  DefaultButton({
   required this.buttonWidget,
   required this.function,
   this.width=double.infinity,
   this.background=Colors.blue,
   this.isUpperColor=true,
   this.radius=0.0
});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background
      ),
      child: MaterialButton(
        onPressed: function,
        child: buttonWidget,
      ),
    );
  }
}
