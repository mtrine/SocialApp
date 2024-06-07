import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:social_network/src/components/textFormBuilder.dart';
import 'package:social_network/src/utils/validation.dart';
import 'package:social_network/src/view_models/auth/signUpViewModel.dart';

import '../widgets/circularProgress.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    SignUpViewModel viewModel =Provider.of<SignUpViewModel>(context);
    return LoadingOverlay(
        progressIndicator: circularProgress(context),
        isLoading: viewModel.loading,
        child: Scaffold(
          key:viewModel.scaffoldKey,
          body:ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 10),
              Text(
                  'Chào mừng bạn đến Wooble\nTạo mot tài khỏan và kết bạn',
                  style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
              ),
              const SizedBox(height: 30,),
              Form(
                key: viewModel.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormBuilder(
                      enabled: !viewModel.loading,
                      prefix: Ionicons.person_outline,
                      hintText: 'Username',
                      textInputAction: TextInputAction.next,
                      validateFunction: Validations.validateName,
                      onSaved: (String name){
                        viewModel.setName(name);
                      },
                      focusNode: viewModel.usernameFN,
                      nextFocusNode: viewModel.passFN,
                    ),
                    const SizedBox(height: 20,),
                    TextFormBuilder(
                      enabled: !viewModel.loading,
                      prefix: Ionicons.mail_outline,
                      hintText: 'Email',
                      textInputAction: TextInputAction.next,
                      validateFunction: Validations.validateEmail,
                      onSaved: (String name){
                        viewModel.setEmail(name);
                      },
                      focusNode: viewModel.emailFN,
                      nextFocusNode: viewModel.countryFN,
                    ),
                    const SizedBox(height: 20,),
                    TextFormBuilder(
                      enabled: !viewModel.loading,
                      prefix: Ionicons.pin_outline,
                      hintText: 'Đất nước',
                      textInputAction: TextInputAction.next,
                      validateFunction: Validations.validateName,
                      onSaved: (String name){
                        viewModel.setCountry(name);
                      },
                      focusNode: viewModel.countryFN,
                      nextFocusNode: viewModel.passFN,
                    ),
                    const SizedBox(height: 20,),
                    TextFormBuilder(
                      enabled: !viewModel.loading,
                      prefix: Ionicons.lock_closed_outline,
                      hintText: 'Mật khẩu',
                      textInputAction: TextInputAction.next,
                      validateFunction: Validations.validatePassword,
                      obscureText: true,
                      onSaved: (String name){
                        viewModel.setPassword(name);
                      },
                      focusNode: viewModel.passFN,
                      nextFocusNode: viewModel.cPassFN,
                    ),
                    const SizedBox(height: 20,),
                    TextFormBuilder(
                      enabled: !viewModel.loading,
                      prefix: Ionicons.lock_open_outline,
                      hintText: 'Nhập lại mật khẩu',
                      textInputAction: TextInputAction.next,
                      validateFunction: Validations.validatePassword,
                      submitAction: () => viewModel.signUp(context),
                      obscureText: true,
                      onSaved: (String name){
                        viewModel.setConfirmPass(name);
                      },
                      focusNode: viewModel.cPassFN,
                    ),
                    const SizedBox(height:25),
                    ElevatedButton(
                        onPressed: (){
                          viewModel.signUp(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:Theme.of(context).colorScheme.secondary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)
                          ),
                          fixedSize: Size(180,46),
                        ),
                        child: Text(
                          'Đăng kí'.toUpperCase(),
                          style: const TextStyle(
                              color:Colors.white,
                              fontSize: 12,
                              fontWeight:FontWeight.w600
                          ),
                        )
                    )
                  ],
                ),

              ),

            ],

          )
        )
    );
  }
}
