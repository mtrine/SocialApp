import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Center circularProgress(context){
    return Center(
      child:SpinKitFadingCircle(
          size:40,
          color: Theme.of(context).colorScheme.secondary,
      )
    );
}

LinearProgressIndicator linearProgress(context){
    return LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Theme.of(context).colorScheme.secondary),
    );
}