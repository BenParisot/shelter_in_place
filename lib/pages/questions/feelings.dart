import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';
import 'package:shelter_in_place/pages/util/round_checkbox.dart';

import 'my_bottom_bar.dart';
import 'my_continue_button.dart';

class Feelings extends StatefulWidget {
  @override
  _FeelingsState createState() => _FeelingsState();
}

class _FeelingsState extends State<Feelings> {
  HashMap answers = new HashMap<String, bool>();

  @override
  Widget build(BuildContext context) {
    final dayModel = Provider.of<Day>(context);

    List<String> feelings = [
      "Happy",
      "Angry",
      "Depressed",
      "Joyful",
      "Surprised",
      "Excited",
      "Sad",
      "Silly",
      "Anxious",
      "Scared",
      "Calm",
      "Distracted"
    ];
    feelings.forEach((feeling) => answers.putIfAbsent(feeling, () => false));

    GridView tiles = GridView.count(
        // Create a grid with 2 columns
        crossAxisCount: 2,
        childAspectRatio: 3,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        // Generate 100 widgets that display their index in the List.
        children: feelings.map((String keyName) {
          return GridTile(
              child: LabeledCheckbox(
            label: AppLocalizations.of(context).translate(keyName),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            value: answers[keyName],
            onChanged: (bool newValue) {
              setState(() {
                answers.update(keyName, (e) => newValue);
              });
            },
          ));
        }).toList());

    CustomContinueButton continueButton = CustomContinueButton(
      onPressed: () {
        HashMap chosenActivities = answers;
        chosenActivities.removeWhere((k, v) => !v);
        dayModel.feelings = chosenActivities.keys.toList();
        Navigator.pushNamed(context, 'fourth-question');
      },
    );

    return SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
            bottomNavigationBar: CustomBottomBar(
              continueButton: continueButton,
            ),
            body: Center(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
                  child: Column(children: <Widget>[
                    Text(
                        AppLocalizations.of(context)
                            .translate('question feelings'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    SizedBox(height: 40.0),
                    new Flexible(              fit: FlexFit.tight,
                        child: tiles)
                  ])),
            )));
  }
}
