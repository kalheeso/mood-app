import 'package:flutter/material.dart';

class StandardButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final Color color;
  const StandardButton({Key key, this.onPressed, this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        width: 150,
        child: RaisedButton(
          disabledColor: Colors.grey,
            color: color,
            shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            onPressed: onPressed,
            child: Text(
              "$title",
              style: TextStyle(color: Colors.white),
            )));
  }
}
