import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_app/app/pages/login/login_controller.dart';
import 'package:habit_app/app/pages/reset_password/reset_password_page.dart';
import 'package:habit_app/app/pages/sign_up/sign_up_page.dart';
import 'package:habit_app/app/utils/app_colors.dart';
import 'package:habit_app/app/widgets/app_button.dart';
import 'package:habit_app/app/widgets/app_text_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    context.read<LoginController>().loadData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
                child: Image.asset('assets/images/splash.png')),
            SingleChildScrollView(
              child: Container(
                height: 692,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      const Color(0xffFFF3E9).withOpacity(0.0),
                      const Color(0xffFFF3E9),
                    ],
                    stops: const [0.0, 1.0],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.only(top: 50, right: 30),
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(65),
                      color: AppColors.purple.withOpacity(0.1),
                    ),
                    child: const Icon(Icons.question_mark),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'WELCOME TO MONUMENTAL HABITS',
                      style: TextStyle(
                        color: Color(0xff573353),
                        fontWeight: FontWeight.w400,
                        fontSize: 32,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      height: 50,
                      child: AppButton(
                        backgroundColor: Colors.white,
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            SizedBox(
                              height: 32,
                              width: 32,
                              child: SvgPicture.asset(
                                  'assets/icons/ic_google.svg'),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            const Text(
                              'Continue with  Google     ',
                              style: TextStyle(
                                color: Color(0xff573353),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      height: 50,
                      child: AppButton(
                        backgroundColor: Colors.white,
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            SizedBox(
                              width: 32,
                              height: 32,
                              child: SvgPicture.asset(
                                  'assets/icons/ic_facebook.svg'),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            const Text(
                              'Continue with  Facebook',
                              style: TextStyle(
                                color: Color(0xff573353),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            'Log in with email',
                            style: TextStyle(
                              color: Color(0xff573353),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Divider(
                            color: Color(0xffFFF3E9),
                            height: 1,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          AppTextField(
                            hintText: 'Email',
                            filled: true,
                            fillColor: AppColors.orangeOpacity,
                            textStyle: TextStyle(
                                color: AppColors.orangeText, fontSize: 16),
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              color: AppColors.orangeText,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Selector<LoginController, bool>(
                            selector: (context, state) {
                              return state.obscureText;
                            },
                            builder: (context, value, widget) {
                              return AppTextField(
                                clickSuffixIcon: () {
                                  context
                                      .read<LoginController>()
                                      .setObscureText();
                                },
                                obscureText: value,
                                suffixIcon: value
                                    ? Icon(Icons.remove_red_eye_outlined,
                                        color: AppColors.orangeText)
                                    : Icon(Icons.remove_red_eye,
                                        color: AppColors.orangeText),
                                hintText: 'Password',
                                filled: true,
                                fillColor: AppColors.orangeOpacity,
                                textStyle: TextStyle(
                                    color: AppColors.orangeText, fontSize: 16),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: AppColors.orangeText,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: AppButton(
                              content: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ResetPasswordPage()));
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: AppColors.purple),
                            ),
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Don’t have an account? ',
                                  style: TextStyle(color: AppColors.purple)),
                              TextSpan(
                                  recognizer: TapAndPanGestureRecognizer()
                                    ..onTapDown = (value) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignUpPage()));
                                    },
                                  text: 'Sign up',
                                  style: TextStyle(
                                      color: AppColors.purple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14))
                            ]),
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
