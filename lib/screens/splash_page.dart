import 'package:flutter/material.dart';
import 'package:guzo/main/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  _navigateHome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/splash.jpg"),
          fit: BoxFit.cover,
        )),
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              color: Color.fromRGBO(31, 27, 104, 10),
              child: Center(
                child: Image.asset("assets/guzo.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
