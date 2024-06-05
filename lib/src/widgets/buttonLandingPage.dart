import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonLandingPage extends StatelessWidget {
  const ButtonLandingPage({
    super.key,
    required this.nextPage,
    required this.content
  });
  final Widget nextPage;
  final String content;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:(){
          Navigator.of(context).pushReplacement(
            CupertinoPageRoute(
              builder: (_) => nextPage,
            ),
          );
        },
        child:Container(
          height: 45,
          width: 130,
          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(40),
            border:Border.all(color:Colors.grey),
            gradient:LinearGradient(
                begin:Alignment.topRight,
                end: Alignment.topLeft,
                colors:[
                  Theme.of(context).colorScheme.secondary,
                  const Color(0xff597FDB)
                ]
            ),
          ),
          child: Center(
            child: Text(
              content,
              style: TextStyle(
                  fontWeight:FontWeight.w900,
                  color:Colors.white
              ),
            ),
          ),
        )
    );
  }
}