import 'package:calculadora_imc_flutter/components/buttom_button.dart';
import 'package:calculadora_imc_flutter/components/reusable_card.dart';
import 'package:calculadora_imc_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {Key? key,
      required this.imcResult,
      required this.resultText,
      required this.interpretation})
      : super(key: key);
  final String imcResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Calculadora IMC',
            style: TextStyle(color: Color(0xFF8D8E98)),
          ),
        ),
        backgroundColor: const Color(0xFF111328),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Seu Resultado",
                style: GoogleFonts.nunito(
                  color: const Color(0xFFEB1555),
                  fontSize: 50.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    imcResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
          ButtomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: "Re-Calcular")
        ],
      ),
    );
  }
}
