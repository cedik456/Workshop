import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/components.dart';
import 'package:flutter_workshop_app/screens/login_page.dart';
import 'package:flutter_workshop_app/styles.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    
    final FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Sign Up',
          style: TextStyles.displayTextMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            CustomTextField(
              controller: usernameController,
              type: CustomTextFieldType.login,
              labelText: 'Email',
            ),
            const SizedBox(height: 15),
            CustomTextField(
              controller: passwordController,
              type: CustomTextFieldType.password,
              labelText: 'Password',
            ),
            const SizedBox(height: 15),
            CustomTextField(
              controller: confirmPasswordController,
              type: CustomTextFieldType.password,
              labelText: 'Confirm Password',
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: CustomButton(
                type: CustomButtonType.secondary,
                text: 'Sign Up',
                buttonColor: CustomColors.blue,
                onPressed: () async {
                  try {
                    await auth
                        .createUserWithEmailAndPassword(
                          email: usernameController.text, 
                          password: passwordController.text
                            ).then((value) {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: ((BuildContext context) => const LoginPage())));
                           Fluttertoast.showToast(

                            msg:'Succesfully Signup',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white);

                           Navigator.pushReplacement (
                              context,
                              MaterialPageRoute(
                                builder: ((BuildContext context) =>
                                    const LoginPage())));
                      });
                    } on FirebaseAuthException catch(error) {
                     Fluttertoast.showToast (
                      msg:'Succesfully Signup',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.grey,
                      textColor: Colors.white);
                    } catch (error) {
                    print(error.toString());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
