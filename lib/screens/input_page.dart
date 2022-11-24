import 'package:calculadora_imc_flutter/calculator_brain.dart';
import 'package:calculadora_imc_flutter/components/buttom_button.dart';
import 'package:calculadora_imc_flutter/components/icon_content.dart';
import 'package:calculadora_imc_flutter/components/reusable_card.dart';
import 'package:calculadora_imc_flutter/components/round_icon_button.dart';
import 'package:calculadora_imc_flutter/constants.dart';
import 'package:calculadora_imc_flutter/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  feminino,
  masculino,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectGender;
  int altura = 150;
  int peso = 60;
  int idade = 25;

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: selectGender == Gender.masculino
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: const IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: "Masculino",
                  ),
                  onPress: () {
                    setState(() {
                      selectGender = Gender.masculino;
                    });
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: selectGender == Gender.feminino
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: const IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: "feminino",
                  ),
                  onPress: () {
                    setState(() {
                      selectGender = Gender.feminino;
                    });
                  },
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Altura",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        altura.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTickMarkColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: altura.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          altura = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Peso",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          peso.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  peso--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  peso++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Idade",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          idade.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  idade--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  idade++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          ButtomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(peso: peso, altura: altura);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                        imcResult: calc.calcImc(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation())),
              );
            },
            buttonTitle: "Calcular IMC",
          )
        ],
      ),
    );
  }
}
