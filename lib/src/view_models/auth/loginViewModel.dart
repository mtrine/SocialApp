import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/homeScreen.dart';
import '../../services/authService.dart';
import '../../utils/validation.dart';

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

    forgotPassword(BuildContext context) async{
        loading= true;
        notifyListeners();
        FormState form= formKey.currentState!;
        form.save();
        print(Validations.validateEmail(email));
        if(Validations.validateEmail(email)!=null){
            showInSnackBar(
                'Hãy nhập email hợp lệ để tạo lại mật khẩu mới',
                context
            );
        }
        else{
            try{
            await auth.forgotPassword(email!);
            showInSnackBar(
                'Hãy nhập email hợp lệ để tạo lại mật khẩu mới',
                context
            );
            }catch(e){
                showInSnackBar("$e", context);
            }
        }
        loading=true;
        notifyListeners();
    }

    setEmail(val) {
        email = val;
        notifyListeners();
    }

    setPassword(val) {
        password = val;
        notifyListeners();
    }

    void showInSnackBar(String value,context) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
    }
}