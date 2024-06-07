import 'package:flutter/material.dart';
import 'package:social_network/src/services/authService.dart';

class SignUpViewModel extends ChangeNotifier{
  final GlobalKey<ScaffoldState> scaffoldKey=GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey= GlobalKey<FormState>();
  bool validate= false;
  bool loading =false;
  String? username, email, country, password, cPassword;
  FocusNode emailFN=FocusNode();
  FocusNode passFN=FocusNode();
  FocusNode usernameFN=FocusNode();
  FocusNode countryFN=FocusNode();
  FocusNode cPassFN=FocusNode();
  AuthService auth =AuthService();

  signUp(BuildContext context) async{
    FormState form=formKey.currentState!;
    form.save();
    if(!form.validate()){
      validate=true;
      notifyListeners();
      showInSnackBar('Vui lòng sửa lỗi trước khi gửi form',context);
    }
    else{
      if(password==cPassword) {
        loading = true;
        notifyListeners();
        try {
          bool success = await auth.createUser(
              email: email,
              name: username,
              password: password,
              country: country
          );
          print(success);
          if (success) {

          }
        } catch (e) {
          loading = false;
          notifyListeners();
          print(e);
          showInSnackBar(
              auth.handleFirebaseAuthError(e.toString()), context);
        }
        loading = false;
        notifyListeners();
      }else{
        showInSnackBar('Mật khẩu không chính xác', context);
      }
    }
  }

  setEmail(val) {
    email = val;
    notifyListeners();
  }

  setPassword(val) {
    password = val;
    notifyListeners();
  }

  setName(val) {
    username = val;
    notifyListeners();
  }

  setConfirmPass(val) {
    cPassword = val;
    notifyListeners();
  }

  setCountry(val) {
    country = val;
    notifyListeners();
  }

  void showInSnackBar(String value, context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}