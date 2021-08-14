import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:buku_meonk/routes.dart';
import 'package:flutter/material.dart';
import 'package:buku_meonk/global.dart' as global;

class SplashScreenMain extends StatefulWidget {
  const SplashScreenMain({Key? key}) : super(key: key);

  @override
  _SplashScreenMainState createState() => _SplashScreenMainState();
}

class _SplashScreenMainState extends State<SplashScreenMain> {
  @override
  void initState() {
    super.initState();
    global.getIsdark();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1800), () {});
    Navigator.of(context).pushReplacement(goToHome());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                child: Image.asset('images/cat2.jpg'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedTextKit(isRepeatingAnimation: false, animatedTexts: [
                    RotateAnimatedText('Meonk',
                        duration: Duration(
                          milliseconds: 1400,
                        ),
                        transitionHeight: 40,
                        rotateOut: false,
                        textStyle: TextStyle(fontSize: 30)),
                  ]),
                  AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      RotateAnimatedText(
                        'Book',
                        duration: Duration(milliseconds: 1100),
                        rotateOut: false,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),

      // Container(
      //   child: Text("Meonk Book"),
      // ),
    );
  }
}
