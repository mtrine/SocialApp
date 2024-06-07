import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:social_network/src/auth/signUp.dart';
import 'package:social_network/src/view_models/auth/loginViewModel.dart';
import 'package:social_network/src/widgets/circularProgress.dart';
import '../widgets/formLogin.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = Provider.of<LoginViewModel>(context);
    return LoadingOverlay(
        progressIndicator:circularProgress(context),
        isLoading: viewModel.loading,
      child: Scaffold(
        body: ListView(
          padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/5,),
            SizedBox(
              height:170,
              width: MediaQuery.of(context).size.width,
              child:Image.asset(
                  'assets/images/login.png'
              )
            ),
            const SizedBox(height: 10,),
            const Center(
              child:Text(
                'Chào mừng bạn trở lại',
                style:TextStyle(
                  fontSize:23.0,
                  fontWeight: FontWeight.w900,
                )
              )
            ),
            Center(
              child: Text(
                'Đăng nhập và bắt đầu trải nghiệm!',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight:FontWeight.w300,
                  color:Theme.of(context).colorScheme.secondary
                ),
              ),
            ),
            const SizedBox(height: 25,),
            FormLogin(viewModel: viewModel),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                    'Bạn chưa có tài khoản ?',
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (_) => const SignUp(),
                      ),
                    );
                  },
                  child: Text(
                    ' Đăng kí ngay',
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


