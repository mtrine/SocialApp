import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:social_network/src/view_models/theme/themeViewModel.dart';

List<SingleChildWidget> providers=[
  ChangeNotifierProvider(create: (_)=>ThemeProvider()),
];