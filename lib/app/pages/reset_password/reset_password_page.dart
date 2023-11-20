import 'package:flutter/material.dart';
import 'package:habit_app/app/pages/reset_password/reset_password_controller.dart';
import 'package:habit_app/app/utils/app_colors.dart';
import 'package:habit_app/app/widgets/app_button.dart';
import 'package:habit_app/app/widgets/app_text_field.dart';
import 'package:provider/provider.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.orangeOpacity,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(top: 15),
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: AppColors.purple.withOpacity(0.1),
                      ),
                      child: const Icon(Icons.arrow_back_outlined),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(
                  height: 27,
                ),
                Text(
                  'FORGOT YOUR PASSWORD?',
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Image.asset('assets/images/chest.png'),
                const SizedBox(
                  height: 45,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        'Enter your registered email below to receive\n password reset instruction',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.purple),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Selector<ResetPasswordController, String>(
                        selector: (_, state) {
                          return state.email;
                        },
                        builder: (context, value, widget) {
                          return AppTextField(

                            prefixIcon: Icon(
                              Icons.mail_outline,
                              color: AppColors.orangeText,
                            ),
                            hintText: 'Email',
                            textStyle: TextStyle(
                              color: AppColors.orangeText,
                            ),
                            filled: true,
                            fillColor: AppColors.orangeOpacity,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: AppButton(
                          content: Text(
                            'Send Reset Link',
                            style: TextStyle(
                                color: AppColors.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Remember password? ',
                        style: TextStyle(color: AppColors.purple)),
                    TextSpan(
                        recognizer: TapAndPanGestureRecognizer()
                          ..onTapDown = (value) {
                            Navigator.pop(context);
                          },
                        text: 'Login',
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
