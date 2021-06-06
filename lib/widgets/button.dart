import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomButton extends StatelessWidget{
  final String text;
  final int backFillColor;
  final int textColor;
  final double buttonTextSize;
  final Function callback;
  const CustomButton(this.text , this.callback , {this.buttonTextSize = 24.0 , this.backFillColor = 0xFF283637 ,this.textColor = 0xFFFFFFFF , Key?  key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: SizedBox(
          width: 70,
          height: 70,
          child: FlatButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
              color: backFillColor != null ? Color(backFillColor) : null,
              textColor: Color(textColor),
              onPressed: (){
                callback(text);
              },
              child: Text(text, style: GoogleFonts.rubik(
                textStyle: TextStyle(
                    fontSize: buttonTextSize
                ),
              ),))
      ),
    );
  }

}