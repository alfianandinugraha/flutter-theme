// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class BaseTextStyle {
  static TextStyle bodyText2 = TextStyle(
    fontSize: 14
  );

  static TextStyle headline1 = BaseTextStyle.bodyText2.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.bold
  );
}

class BaseButtonStyle {
  static ButtonStyle base = ButtonStyle(
    textStyle: MaterialStateProperty.all<TextStyle>(BaseTextStyle.bodyText2),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      )
    ),
    padding: MaterialStateProperty.all<EdgeInsets>(
      EdgeInsets.fromLTRB(28, 20, 28, 20)
    )
  );

  static ButtonStyle elevated = BaseButtonStyle.base.copyWith(
    elevation: MaterialStateProperty.all(0),
  );

  static ButtonStyle outlined = BaseButtonStyle.base.copyWith(
    side: MaterialStateProperty.all<BorderSide>(
      BorderSide(color: Colors.red, width: 1.0, style: BorderStyle.solid)
    )
  );
}

class App extends StatelessWidget {
  const App({Key ?key}) : super(key:  key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black87,
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText2: BaseTextStyle.bodyText2.copyWith(
            color: Colors.white
          ),
          headline1: BaseTextStyle.headline1.copyWith(
            color: Colors.white
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: BaseButtonStyle.elevated
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: BaseButtonStyle.outlined.copyWith(
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: Colors.blue)
            )
          )
        ),
        textButtonTheme: TextButtonThemeData(
          style: BaseButtonStyle.base
        )
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.red,
        fontFamily: 'OpenSans',
        textTheme: TextTheme(
          bodyText2: BaseTextStyle.bodyText2,
          headline1: BaseTextStyle.headline1
        ),
        textButtonTheme: TextButtonThemeData(
          style: BaseButtonStyle.base
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: BaseButtonStyle.outlined
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: BaseButtonStyle.elevated
        )
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello World !"),
            SizedBox(height: 20),
            Text("Hello World !", style: Theme.of(context).textTheme.headline1),
            SizedBox(height: 20),
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
    );
  }
}
