import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 5),
          () {
        Navigator.pushReplacementNamed(context, 'home');
      },
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset("assets/image/sp1.jpg",fit: BoxFit.cover,height: MediaQuery.sizeOf(context).height,),
          Center(
            child: Image.asset("assets/image/sp.gif"),
          ),
        ],
      ),
    );
  }
}
