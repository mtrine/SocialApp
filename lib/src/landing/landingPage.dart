
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/login.dart';
import '../widgets/buttonLandingPage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPgaeState();
}

class _LandingPgaeState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left:10),
                child:Image.asset(
                  'assets/images/new1.png',
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ) ,
              ),
            ),
            const Text(
              'WOOBLE',
              style: TextStyle(
                fontSize:22,
                fontWeight:FontWeight.w900,
                fontFamily:'Ubuntu-Regular'
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                ButtonLandingPage(nextPage: Login(),content: 'LOGIN',),
                ButtonLandingPage(nextPage: Login(),content: 'SIGNUP',)
            ],
          ),
        ),
      ),
    );
  }
}


