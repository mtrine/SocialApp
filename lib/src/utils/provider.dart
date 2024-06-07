import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:social_network/src/view_models/auth/loginViewModel.dart';
import 'package:social_network/src/view_models/theme/themeViewModel.dart';

import '../view_models/auth/signUpViewModel.dart';

List<SingleChildWidget> providers=[
  ChangeNotifierProvider(create: (_)=>ThemeProvider()),
  ChangeNotifierProvider(create: (_)=>LoginViewModel()),
  ChangeNotifierProvider(create: (_)=>SignUpViewModel()),
];