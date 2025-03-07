import 'package:flutter/material.dart';
import 'package:ott102/presentation/providers/lunch_provider.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({super.key});

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      lunchProvider.addListener(updateScreen);
      lunchProvider.animationStart(context);
    },);
  }

  @override
  void dispose() {
    lunchProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedSlide(
            offset: Offset(0, lunchProvider.animationType1),
            duration: Duration(seconds: 1),

            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.18,
              decoration: BoxDecoration(
                color: Color(0xFFEDECEA),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Image.asset(
                      'assets/images/logo.png',
                      width: MediaQuery.sizeOf(context).width * 0.7,
                    ),
                  ],
                ),
              ),
            ),
          ),

          Spacer(flex: 10,),
          AnimatedOpacity(
            opacity: lunchProvider.animationType2,
            duration: Duration(seconds: 1),
            child: Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    height: MediaQuery.sizeOf(context).width * 0.6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(colors: [
                        Color(0xFF323732),
                        Color(0xFF323732),
                        Color(0xFF323732),
                        Color(0xFF323732),
                        Color(0x99323732),
                        Color(0x323732),
                      ]),
                    ),
                  ),
                  Image.asset(
                    'assets/images/showtime_logo.png',
                    width: MediaQuery.sizeOf(context).width * 0.35,
                    height: MediaQuery.sizeOf(context).width * 0.35,
                  ),
                ],
              ),
            ),
          ),
          Spacer(flex: 15,),
        ],
      ),
    );
  }
}
