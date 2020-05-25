import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neuui/helpers/media_query_helper.dart';
import 'package:neuui/widgets/neu_design/constant.dart';
import 'package:neuui/widgets/neu_design/neu_button.dart';
import 'package:neuui/widgets/neu_design/neu_container.dart';
import 'package:neuui/widgets/neu_design/neu_value_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          fontFamily: 'digital'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String gifImg = "assets/1.gif";

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: MAIN_BACKGROUND_COLOR,
      body: Container(
        padding: EdgeInsets.only(
            top: MediaQueryHelper.safeTopPadding(context) + 20,
            left: 20,
            right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            buildScreen(),
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Text(
                'anKii\'s Apps Corner',
                style: TextStyle(color: TEXT_COLOR),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [buildNavigationButton(), buildAttackButtons()]),
            buildStartPauseButtons(),
            buildSpeaker()
          ],
        ),
      ),
    );
  }

  Widget buildScreen() {
    return NeuContainer(
      borderRadius: 20,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(30),
        child: NeuContainerReverse(
          borderRadius: 10,
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(77, 93, 22, 1),
                borderRadius: BorderRadius.circular(10)),
            height: 200,
            margin: EdgeInsets.all(20),
            child: Container(
              child: Container(
                  child: Image.asset(
                gifImg,
                fit: BoxFit.fill,
              )),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNavigationButton() {
    return Container(
        child: Transform.rotate(
            angle: pi * 0.25,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    NeuButton(
                      borderRadius: 10,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Transform.rotate(
                            angle: -pi * 0.25,
                            child: Icon(
                              Icons.arrow_drop_up,
                              color: TEXT_COLOR,
                            )),
                      ),
                    ),
                    NeuButton(
                      borderRadius: 10,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Transform.rotate(
                            angle: -pi * 0.25,
                            child: Icon(
                              Icons.arrow_right,
                              color: TEXT_COLOR,
                            )),
                      ),
                    )
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    NeuButton(
                      borderRadius: 10,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Transform.rotate(
                            angle: -pi * 0.25,
                            child: Icon(
                              Icons.arrow_left,
                              color: TEXT_COLOR,
                            )),
                      ),
                    ),
                    NeuButton(
                      borderRadius: 10,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Transform.rotate(
                            angle: -pi * 0.25,
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: TEXT_COLOR,
                            )),
                      ),
                    )
                  ]),
                ],
              ),
            )));
  }

  Widget buildAttackButtons() {
    return Container(
      child: Transform.rotate(
        angle: pi * 0.25,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              NeuButton(
                borderRadius: 50,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Transform.rotate(
                      angle: -pi * 0.25,
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(173, 24, 59, 1),
                        child: Text(
                          'A',
                          style: TextStyle(color: MAIN_BACKGROUND_COLOR),
                        ),
                      )),
                ),
              ),
              NeuButton(
                borderRadius: 50,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Transform.rotate(
                      angle: -pi * 0.25,
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(173, 24, 59, 1),
                        child: Text(
                          'B',
                          style: TextStyle(color: MAIN_BACKGROUND_COLOR),
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStartPauseButtons() {
    return Container(
        margin: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: -pi * 0.25,
              child: NeuButton(
                borderRadius: 50,
                child: Container(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      width: 70,
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'SELECT',
                        style: TextStyle(color: TEXT_COLOR),
                      ),
                    )),
              ),
            ),
            Transform.rotate(
              angle: -pi * 0.25,
              child: NeuButton(
                onPress: () {
                  var lstAssets = [
                    "assets/1.gif",
                    "assets/2.gif",
                    "assets/3.gif",
                    "assets/4.gif",
                    "assets/5.gif",
                  ];
                  var randomIndex = Random().nextInt(lstAssets.length);
                  setState(() {
                    gifImg =
                    lstAssets[randomIndex];
                  });
                },
                borderRadius: 50,
                child: Container(
                    padding: EdgeInsets.all(5),
                    child: Container(
                        width: 70,
                        padding: EdgeInsets.all(5),
                        child: Text('START',
                            style: TextStyle(color: TEXT_COLOR)))),
              ),
            )
          ],
        ));
  }

  Widget buildSpeaker() {
    return Expanded(
        child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: NeuContainerReverse(
                borderRadius: 10,
                child: Container(
                    width: 155,
                    height: 60,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          margin:
                              EdgeInsets.only(top: 15, bottom: 15, right: 5),
                          height: 50,
                          width: 5,
                          decoration: BoxDecoration(
                              color: DARK_SHADOW,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 15, bottom: 15, right: 5),
                          height: 50,
                          width: 5,
                          decoration: BoxDecoration(
                              color: DARK_SHADOW,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 15, bottom: 15, right: 5),
                          height: 50,
                          width: 5,
                          decoration: BoxDecoration(
                              color: DARK_SHADOW,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 15, bottom: 15, right: 5),
                          height: 50,
                          width: 5,
                          decoration: BoxDecoration(
                              color: DARK_SHADOW,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 15, bottom: 15, right: 5),
                          height: 50,
                          width: 5,
                          decoration: BoxDecoration(
                              color: DARK_SHADOW,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 15, bottom: 15, right: 5),
                          height: 50,
                          width: 5,
                          decoration: BoxDecoration(
                              color: DARK_SHADOW,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 15, bottom: 15, right: 5),
                          height: 50,
                          width: 5,
                          decoration: BoxDecoration(
                              color: DARK_SHADOW,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 15, bottom: 15, right: 5),
                          height: 50,
                          width: 5,
                          decoration: BoxDecoration(
                              color: DARK_SHADOW,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 15, bottom: 15, right: 5),
                          height: 50,
                          width: 5,
                          decoration: BoxDecoration(
                              color: DARK_SHADOW,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 15, bottom: 15, right: 5),
                          height: 50,
                          width: 5,
                          decoration: BoxDecoration(
                              color: DARK_SHADOW,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 15, bottom: 15, right: 5),
                          height: 50,
                          width: 5,
                          decoration: BoxDecoration(
                              color: DARK_SHADOW,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 15, bottom: 15, right: 5),
                          height: 50,
                          width: 5,
                          decoration: BoxDecoration(
                              color: DARK_SHADOW,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 15, bottom: 15, right: 5),
                          height: 50,
                          width: 5,
                          decoration: BoxDecoration(
                              color: DARK_SHADOW,
                              borderRadius: BorderRadius.circular(30)),
                        )
                      ],
                    )),
              ),
            )));
  }
}
