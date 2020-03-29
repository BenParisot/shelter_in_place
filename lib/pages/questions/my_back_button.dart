import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios),
        label: Text(AppLocalizations.of(context).translate('back')));
  }
}
