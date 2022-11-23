import 'package:calculadora_imc_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

class ButtomButton extends StatelessWidget {
  const ButtomButton({Key? key, required this.onTap, required this.buttonTitle})
      : super(key: key);
  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 30.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        color: kBottomContainerColour,
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 5.0),
        height: kbottomContainerHeight,
      ),
    );
  }
}
