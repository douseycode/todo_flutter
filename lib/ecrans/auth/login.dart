import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/login_controller.dart';
import 'package:todo/rootes.dart';
import 'package:todo/widgets/custom_button.dart';
import 'package:todo/widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

   final loginController = Get.put(LoginController());
  
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SingleChildScrollView(
       child: Padding(
        padding: const EdgeInsets.all(15.0),
         child: GetBuilder<LoginController>(
           builder: (controller) {
             return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 120,),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'DouseyCode',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 54,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                 CustomTextField(hint: 'Email', controller: controller.emailController,),
                const SizedBox(height: 10,),
                 CustomTextField(hint: 'Mot de passe' , obscureText: true, controller: controller.passwordController,),
                const SizedBox(height: 20,),
               CustomButton(
                label: 'Se connecter', 
                onPressed: (){
                  controller.checkLogin();
                },
               ),
                 const SizedBox(height: 20,),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Color(0xff949494),
                    ),
                    children: [
                      const TextSpan(
                        text: 'Pas de compte ? ',
                      ),
                      TextSpan(
                        text: "S'incrire",
                        recognizer: TapGestureRecognizer()..onTap= (){
                          Get.toNamed(GetRoutes.register);
                          
                        },
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),softWrap: false,
                ),
              ],
                     );
           }
         ),
       ),
      ),
    );
  }
}
