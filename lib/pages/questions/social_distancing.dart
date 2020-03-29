import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelter_in_place/models/day_model.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';

class SocialDistancing extends StatefulWidget {
  @override
  _SocialDistancingState createState() => _SocialDistancingState();
}

class _SocialDistancingState extends State<SocialDistancing> {
  @override
  Widget build(BuildContext context) {
    final dayModel = Provider.of<Day>(context);

    return SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 100.0),
                Center(
                    child: Text(
                        AppLocalizations.of(context)
                            .translate('question social distancing'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 100, 0, 100),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                            textColor: Colors.white,
                            color: Colors.black,
                            child: Text(
                                AppLocalizations.of(context).translate('yes')),
                            onPressed: () {
                              dayModel.socialDistance = true;
                              Navigator.pushNamed(context, 'second-question');
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ), //hack
                          RaisedButton(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                            textColor: Colors.white,
                            color: Colors.black,
                            child: Text(
                                AppLocalizations.of(context).translate('no')),
                            onPressed: () {
                              dayModel.socialDistance = false;
                              Navigator.pushNamed(context, 'second-question');
                            },
                          )
                        ])),
              ],
            ),
          ),
        ));
  }
}
