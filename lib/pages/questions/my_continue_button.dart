import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/localization/localizations.dart';

class CustomContinueButton extends StatelessWidget {
  CustomContinueButton({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
        onPressed: () {
          this.onPressed();
        },
        icon: Icon(Icons.arrow_forward_ios),
        label: Text(AppLocalizations.of(context).translate('continue button text')));
  }
}
