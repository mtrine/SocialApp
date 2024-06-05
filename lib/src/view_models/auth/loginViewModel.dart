import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/homeScreen.dart';
import '../../services/authService.dart';

class LoginViewModel extends ChangeNotifier{
    final GlobalKey<ScaffoldState> scaffoldkey= GlobalKey<ScaffoldState>();
    final GlobalKey<FormState> formKey=GlobalKey<FormState>();
    bool validate=false;
    bool loading=false;
    String? email, password;
    FocusNode emailFN=FocusNode();
    FocusNode passFN=FocusNode();
    AuthService auth =AuthService();

    login(BuildContext context) async{
        FormState form=formKey.currentState!;
        form.save();
        if(!form.validate()){
            validate=true;
            notifyListeners();
            showInSnackBar('Vui lòng sửa lỗi trước khi gửi form',context);
        }
        else{
            loading=true;
            notifyListeners();
            try{
                bool success=await auth.loginUser(
                    email: email,
                    password: password,
                );
                print(success);
                if(success){
                    Navigator.of(context).pushReplacement(
                        CupertinoPageRoute(builder: (_) => HomeScreen()));
                }
            }
            catch(e){
                loading=false;
                notifyListeners();
                print(e);
                showInSnackBar('${auth.handleFirebaseAuthError(e.toString())}',context);
            }
            loading = false;
            notifyListeners();
        }
    }

    void showInSnackBar(String value,context) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
    }
}