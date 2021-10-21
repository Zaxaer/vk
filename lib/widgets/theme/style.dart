import 'package:flutter/material.dart';

class ColorStyleAuth {
  Color blueColor = const Color(0xff4986CC);
  Color greyTFColor = const Color(0xFF818C99);
  Color greyBackGroundTFColor = const Color(0xffEBEDF0);
  Color greyBackGroundWidgetColor = const Color(0xffEBEDF0);
  Color greenColor = const Color(0xFF4BB34B);
  Color whiteColor = Colors.white;
  Color pressButtonColor = const Color(0xffADE1F5);
  Color borderButtonColor = Colors.black;
  Color errorColor = const Color(0xFFFAEBEB);
}

class BottonStyle extends ColorStyleAuth {
  ButtonStyle bottomStyle(
      Color colorBatton, Color colorPress, Color borderColor) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(colorBatton),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      shadowColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      minimumSize: MaterialStateProperty.all(
        const Size(
          double.infinity,
          40,
        ),
      ),
      overlayColor: MaterialStateProperty.all(colorPress),
      side: MaterialStateProperty.all(
        BorderSide(color: borderColor, width: 0.1),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final String text;
  const BottomButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF818C99),
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class TextFielsDecorator {
  InputDecoration style(String text, Widget iconPass, bool padding) {
    return InputDecoration(
      suffix: iconPass,
      hintText: text,
      hintStyle: const TextStyle(
        color: Color(0xFF818C99),
        fontSize: 18,
      ),
      filled: true,
      fillColor: const Color(0xffEBEDF0),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.blue,
        ),
      ),
      contentPadding: (padding)
          ? const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 18)
          // : null,
          : const EdgeInsets.only(left: 10, right: 13, bottom: 0, top: 0),
      isCollapsed: padding,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFD2D6D8),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
