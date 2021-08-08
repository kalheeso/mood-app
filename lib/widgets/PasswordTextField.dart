import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String mensagem) onChanged;
  final String title, value;
  final bool obscureText;
  final String hintText;
  final Widget prefix;
  final Widget suffix;
  const PasswordTextField(
      {Key key,
      this.onChanged,
      this.title,
      this.obscureText = false,
      this.value,
      this.hintText,
      this.textEditingController, this.prefix, this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 7), child: Text("$title")),
              visible: title?.isNotEmpty ?? false),
          Container(
              height: 60,
              child: TextField(
                  style: GoogleFonts.nunitoSans(
                      fontSize: 18, fontWeight: FontWeight.w500),
                  controller: textEditingController,
                  obscureText: obscureText,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                      prefixIcon: prefix,
                      suffixIcon: suffix,
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.teal[300], width: 2.4),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal[300]),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      filled: true,
                      hintStyle: GoogleFonts.nunitoSans(
                          fontSize: 18, fontWeight: FontWeight.w500),
                      hintText: hintText,
                      fillColor: Colors.white)))
        ]);
  }
}
