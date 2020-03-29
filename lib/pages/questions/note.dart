import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/questions/my_continue_button.dart';
import 'package:shelter_in_place/services/days_service.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';

import 'my_bottom_bar.dart';

class NoteForDay extends StatefulWidget {
  @override
  _NoteForDayState createState() => _NoteForDayState();
}

class _NoteForDayState extends State<NoteForDay> {
  @override
  Widget build(BuildContext context) {
    final dayModel = Provider.of<Day>(context);
    final dayService = Provider.of<DaysService>(context);

    CustomContinueButton continueButton = CustomContinueButton(
      onPressed: () async {
        dayModel.date = DateTime.now();
        print(dayModel.date);
        print(dayModel.date.toUtc());
        print(dayModel.date.toLocal());
        print(dayModel.date.toUtc().toLocal());
        await dayService.addDocument(dayModel.toJson());
        Navigator.pushNamed(context, 'summary');
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
            child: Column(
              children: <Widget>[
                SizedBox(height: 70.0),
                Text(
                    AppLocalizations.of(context).translate('note today'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child:TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: AppLocalizations.of(context)
                          .translate('note today hint')),
                  onChanged: (text) {
                    dayModel.note = text;
                  },
                )),
              ],
            ),
          ),
        ));
  }
}
