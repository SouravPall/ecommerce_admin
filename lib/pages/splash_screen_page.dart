import 'dart:async';

import 'package:ecommerce_admin/pages/launcher_page.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  static const routeName ='/splashscreen-page';
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LauncherPage()))
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Center(
                child: Image.asset(
                    'images/shopping-cart.gif',
                  width: 120,
                  height: 120,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 10,),
              Title(color: Colors.lightBlueAccent, child: const Text('E-commerce', style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 40, color: Colors.greenAccent
              ),))
            ],
          ),
        ],
      ),

    );
  }
}
