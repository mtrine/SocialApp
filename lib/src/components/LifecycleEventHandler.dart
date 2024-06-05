import 'package:flutter/cupertino.dart';

class LifcycleEventHandler extends WidgetsBindingObserver{
  LifcycleEventHandler({required this.resumeCallBack, required this.detachedCallBack});
  final Function resumeCallBack;
  final Function detachedCallBack;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state)async{
    switch(state){
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
        await detachedCallBack();
        break;
      case AppLifecycleState.resumed:
        await resumeCallBack();
        break;

        // TODO: Handle this case.
    }
  }
}