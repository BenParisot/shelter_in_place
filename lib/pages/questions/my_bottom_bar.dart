import 'package:flutter/material.dart';
import 'package:shelter_in_place/pages/questions/my_continue_button.dart';

import 'my_back_button.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({@required this.continueButton});

  final CustomContinueButton continueButton;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomBackButton(),
          continueButton,
        ],
      ),
    );
  }
}



