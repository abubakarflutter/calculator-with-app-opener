
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/button.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';



void main() {
  runApp(MyCalculatorApp());
}


class MyCalculatorApp extends StatefulWidget {
  const MyCalculatorApp({Key? key}) : super(key: key);

  @override
  CalculatorAppState createState() => CalculatorAppState();
}


class CalculatorAppState extends State<MyCalculatorApp> {

  String _enteredValue = "";
  String _currentValue = "";

  void numClick(String text) {
    setState(() {
      _currentValue += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _currentValue = "";
      _enteredValue = "";
    });
  }

  void clear(String text) {
    setState(() {
      _currentValue = '';
    });
  }

  void solvedValue(String text) {

    Parser p = Parser();
    Expression exp = p.parse(_currentValue);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _enteredValue = _currentValue;
      _currentValue = eval.toString();
    });
  }



  Future<void> _launchLinkViaApp(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchedSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchedSucceeded) {
        await launch(url , forceSafariVC: true);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator & App Opener',
      home: Scaffold(
        backgroundColor: Color(0xFF283637),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(right: 20.0),
              alignment: Alignment(1, 1),
              child: Text(_enteredValue, style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                      fontSize: 30.0,
                      color: Colors.grey[700]
                  )
              ),),
            ),
            Container(
              padding: EdgeInsets.only(right: 20.0, bottom: 16.0),
              alignment: Alignment(1, 1),
              child: Text(_currentValue, style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white
                  )
              ),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton('AC' , allClear , backFillColor: 0xFF6C807F, buttonTextSize: 21.0,),
                CustomButton('C', clear , backFillColor: 0xFF6C807F,),
                CustomButton('/', numClick , backFillColor: 0xFFFFFFFF, textColor: 0xFF65BDAC,),
                CustomButton('%', numClick , backFillColor: 0xFFFFFFFF,textColor: 0xFF65BDAC),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton('7', numClick ),
                CustomButton('8', numClick ),
                CustomButton('9', numClick ),
                CustomButton('*', numClick ,backFillColor: 0xFFFFFFFF,textColor: 0xFF65BDAC),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton('4' , numClick ,),
                CustomButton('5' , numClick ,),
                CustomButton('6', numClick ,),
                CustomButton('-', numClick , backFillColor: 0xFFFFFFFF,textColor: 0xFF65BDAC),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton('1' , numClick),
                CustomButton('2', numClick ),
                CustomButton('3', numClick ),
                CustomButton('+', numClick ,backFillColor: 0xFFFFFFFF,textColor: 0xFF65BDAC),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton('.' , numClick ,),
                CustomButton('0', numClick ,),
                CustomButton('00', numClick ,),
                CustomButton('=', solvedValue , backFillColor: 0xFFFFFFFF,textColor: 0xFF65BDAC),

              ],
            ),
            //AppOpeners
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                      onPressed: (){
                        _launchLinkViaApp('https://youtube.com');
                      },
                      child: Center(child: FaIcon(FontAwesomeIcons.youtube, size: 30, color: Colors.red,)),
                    ),
                  ),),
                Container(
                  margin: EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                      onPressed: (){
                        _launchLinkViaApp('https://instagram.com');
                      },
                      child: Center(child: FaIcon(FontAwesomeIcons.instagram, size: 30, color: Colors.red,)),
                    ),
                  ),),
                Container(
                  margin: EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                      onPressed: (){
                        _launchLinkViaApp('https://www.google.com/maps/search/?api=1&query=52.32,4.917');
                      },
                      child: Center(child: FaIcon(FontAwesomeIcons.mapMarker, size: 30, color: Colors.green,)),
                    ),
                  ),),
                Container(
                  margin: EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                      onPressed: (){
                        _launchLinkViaApp('https://drive.google.com/drive/my-drive');
                      },
                      child: Center(child: FaIcon(FontAwesomeIcons.googleDrive, size: 30, color: Colors.green,)),
                    ),
                  ),),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
