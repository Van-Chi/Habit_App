import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_app/app/pages/login/login_page.dart';
import 'package:habit_app/app/pages/sign_up/sign_up_controller.dart';
import 'package:habit_app/app/utils/app_colors.dart';
import 'package:habit_app/app/widgets/app_button.dart';
import 'package:habit_app/app/widgets/app_text_field.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  void initState() {
    context.read<SignUpController>().loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orangeOpacity,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/ic_create_your_account.svg'),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'CREATE YOUR ACCOUNT',
                  style: TextStyle(
                    color: AppColors.purple,
                    fontSize: 24,
                  ),
                ),
                AppTextField(
                  fillColor: Colors.white,
                  filled: true,
                  textStyle:
                      TextStyle(color: AppColors.orangeText, fontSize: 16),
                  prefixIcon: Icon(
                    Icons.person,
                    color: AppColors.orangeText,
                  ),
                  hintText: 'User name',
                ),
                const SizedBox(
                  height: 8,
                ),
                AppTextField(
                  fillColor: Colors.white,
                  filled: true,
                  textStyle:
                      TextStyle(color: AppColors.orangeText, fontSize: 16),
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    color: AppColors.orangeText,
                  ),
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 8,
                ),
                Selector<SignUpController, bool>(
                  selector: (context, state) {
                    return state.obscureText;
                  },
                  builder: (context, value, widget) {
                    return AppTextField(
                      textStyle:
                          TextStyle(color: AppColors.orangeText, fontSize: 16),
                      clickSuffixIcon: () {
                        context.read<SignUpController>().setObscureText();
                      },
                      obscureText: value,
                      suffixIcon: value
                          ? Icon(Icons.remove_red_eye_outlined,
                              color: AppColors.orangeText)
                          : Icon(Icons.remove_red_eye,
                              color: AppColors.orangeText),
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColors.orangeText,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    );
                  },
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      height: 16,
                      width: 16,
                      child: Selector<SignUpController, bool>(
                        selector: (_, state) {
                          return state.keepCheck;
                        },
                        builder: (context, value, widget) {
                          return Checkbox(
                              value: value,
                              onChanged: (value) {
                                context.read<SignUpController>().setKeepCheck();
                              },
                              activeColor: AppColors.orangeText);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Keep me signed in',
                      style: TextStyle(
                          color: AppColors.purple,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      height: 16,
                      width: 16,
                      child: Selector<SignUpController, bool>(
                        selector: (_, state) {
                          return state.keepEmail;
                        },
                        builder: (context, value, widget) {
                          return Checkbox(
                              value: value,
                              onChanged: (value) {
                                context.read<SignUpController>().setKeepEmail();
                              },
                              activeColor: AppColors.orangeText);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Email me about special pricing and more',
                      style: TextStyle(
                          color: AppColors.purple,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: AppButton(
                    content: Text(
                      'Create Account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      color: AppColors.purple,
                      thickness: 1,
                      endIndent: 5,
                    )),
                    const Text('Or sign in with'),
                    Expanded(
                        child: Divider(
                      color: AppColors.purple,
                      thickness: 1,
                      indent: 5,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: AppButton(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 23,
                              width: 23,
                              child: SvgPicture.asset(
                                  'assets/icons/ic_google.svg')),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Google',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: AppButton(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 23,
                              width: 23,
                              child: SvgPicture.asset(
                                  'assets/icons/ic_facebook.svg')),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Facebook',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(color: AppColors.purple)),
                    TextSpan(
                        recognizer: TapAndPanGestureRecognizer()
                          ..onTapDown = (value) {
                            Navigator.pop(context);
                          },
                        text: 'Sign in',
                        style: TextStyle(
                            color: AppColors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 14))
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
