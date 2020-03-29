import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                border: new Border.all(color: Colors.black, width: 2.0),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: value
                    ? Icon(
                  Icons.check,
                  size: 20.0,
                  color: Colors.black,
                )
                    : Icon(
                  Icons.check,
                  size: 20.0,
                  color: Colors.transparent, // Can't figure out how to do it more beautifully
                )
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(child: Text(label))
          ],
        ),
      ),
    );
  }
}
