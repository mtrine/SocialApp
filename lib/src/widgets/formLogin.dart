import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../components/textFormBuilder.dart';
import '../utils/validation.dart';
import '../view_models/auth/loginViewModel.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
    required this.viewModel,
  });

  final LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Form(
      key:viewModel.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormBuilder(
            enabled: !viewModel.loading,
            prefix: Ionicons.mail_outline,
            hintText: 'Email',
            textInputAction: TextInputAction.next,
            validateFunction: Validations.validateEmail,
            onChange: (String val){
              viewModel.setEmail(val);
            },
            focusNode: viewModel.emailFN,
            nextFocusNode: viewModel.passFN,
          ),
          const SizedBox(height: 15,),
          TextFormBuilder(
            enabled: !viewModel.loading,
            prefix: Ionicons.lock_closed_outline,
            suffix: Ionicons.eye_outline,
            obscureText: true,
            hintText: 'Password',
            textInputAction: TextInputAction.next,
            validateFunction: Validations.validatePassword,
            submitAction: () => viewModel.login(context),
            onChange: (String val){
              viewModel.setPassword(val);
            },
            focusNode: viewModel.passFN,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right:10),
              child:InkWell(
                onTap: ()=> viewModel.forgotPassword(context),
                child: Container(
                  width: 130,
                  height: 40,
                  child: const Text(
                    'Quên mật khẩu ?',
                    style:TextStyle(
                        fontWeight: FontWeight.bold
                    ) ,
                  ),
                ),
              ) ,
            ),
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
              onPressed: (){
                viewModel.login(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor:Theme.of(context).colorScheme.secondary,
                  fixedSize: const Size(180, 45),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)
                  )
              ),
              child:Text(
                'Đăng nhập'.toUpperCase(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600
                ),
              )
          )
        ],
      ),
    );
  }
}