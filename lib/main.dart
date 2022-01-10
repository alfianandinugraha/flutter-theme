// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

ButtonStyle baseButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    )
  ),
  padding: MaterialStateProperty.all<EdgeInsets>(
    EdgeInsets.fromLTRB(28, 20, 28, 20)
  )
);

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        textButtonTheme: TextButtonThemeData(
          style: baseButtonStyle
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: baseButtonStyle.copyWith(
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: Colors.red, width: 1.0, style: BorderStyle.solid)
            )
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: baseButtonStyle.copyWith(
            elevation: MaterialStateProperty.all(0),
          )
        )
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text("Hello world"),
                onPressed: () {},
              ),
              SizedBox(height: 20),
              OutlinedButton(
                child: Text("Hellow !"),
                onPressed: (){}, 
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("hello world !"),
                autofocus: false,
                onPressed: () {},
              ),
            ],
          )
        ),
      ),
    );
  }
}
