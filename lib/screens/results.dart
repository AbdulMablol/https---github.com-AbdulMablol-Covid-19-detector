import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/components/default_button.dart';
import 'package:flutter_covid_dashboard_ui/config/palette.dart';
import 'package:flutter_covid_dashboard_ui/data/data.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_covid_dashboard_ui/screens/pcr.dart';

import '../size_config.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({Key key}) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  var usercontroller = TextEditingController();
  String user = '';
  String result = '';

  @override
  void initState() {
    super.initState();
  }

  void positive() {
    usercontroller.text == 'ATHKM6V' ||
            usercontroller.text == 'AJMQUVV' ||
            usercontroller.text == '1'
        ? result = 'Positive'
        : usercontroller.text == 'A4H7SNF' ||
                usercontroller.text == 'A2P3LTM' ||
                usercontroller.text == '2'
            ? result = 'Negative'
            : result = 'Invalid code';
    print(usercontroller.text);
    print(result);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
        backgroundColor: Color(0xFF473F97),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              TextFormField(
                controller: usercontroller,
                decoration: InputDecoration(
                  labelText: 'Enter user code',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: DefaultButton(
                    text: "Submit",
                    width: screenWidth * 0.5,
                    press: () {
                      positive();
                      setState(() {});
                    }),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 40.0,
                  horizontal: 20.0,
                ),
                padding: const EdgeInsets.all(10.0),
                height: screenHeight * 0.18,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFAD9FE4), Palette.primaryColor],
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image.asset('assets/images/test2.png'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // TextFormField(
                        //   decoration: InputDecoration(
                        //     labelText: 'Enter user code',
                        //     border: OutlineInputBorder(),
                        //   ),
                        //   onChanged: (value) => setState(() => value),
                        //   validator: (value) {
                        //     if (value == 'ATHKM6V' || value == 'AJMQUVV') {
                        //       result = 'Positive';
                        //     } else if (value == 'A4H7SNF' || value == 'A2P3LTM') {
                        //       result = 'Negative';
                        //     }
                        //     return null;
                        //   },
                        // ),

                        Text(
                          result,
                          style: TextStyle(
                              fontSize: 22.5,
                              fontWeight: FontWeight.bold,
                              color: result == 'Positive'
                                  ? Color.fromARGB(255, 228, 56, 74)
                                  : result == 'Negative'
                                      ? Colors.green
                                      : Colors.white),
                        ),

                        // SizedBox(
                        //   width: 150,
                        //   child: AnimatedTextKit(
                        //     key: ValueKey<String>(result),
                        //     animatedTexts: [
                        //       ScaleAnimatedText(
                        //         result,
                        //         textStyle: TextStyle(
                        //           fontSize: 25,
                        //           color: Colors.white,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //         textAlign: TextAlign.center,
                        //         duration: Duration(milliseconds: 2000),
                        //         scalingFactor: 0.5,
                        //       ),
                        //     ],
                        //     totalRepeatCount: 3,
                        //   ),
                        // ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 50),
              Text(
                'Some useful scans',
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: scans
                    .map((e) => Column(
                          children: <Widget>[
                            Image.asset(
                              e.keys.first,
                              height: screenHeight * 0.12,
                            ),
                            SizedBox(height: screenHeight * 0.015),
                            Text(
                              e.values.first,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ))
                    .toList(),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15, color: Colors.white),
                  padding: EdgeInsets.only(left: 55),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Pcr()),
                  );
                },
                child: const Text('See locations'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
