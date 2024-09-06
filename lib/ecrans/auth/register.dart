import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/register_controller.dart';
import 'package:todo/rootes.dart';
import 'package:todo/widgets/custom_button.dart';
import 'package:todo/widgets/custom_textfield.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});

  final registerController = Get.put(RegisterController());

  @override
Widget build(BuildContext context) {
    return   Scaffold(
      body: SingleChildScrollView(
       child: Padding(
        padding: EdgeInsets.all(15.0),
         child: GetBuilder<RegisterController>(
           builder: (controller) {
             return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Align(
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
                const SizedBox(height: 30,),
                 CustomTextField(
                  hint: 'Nom',
                  controller: controller.nameController,
                 ),
                const SizedBox(height: 10,),
                 CustomTextField(hint: 'telephone', controller: controller.telController,),
                const SizedBox(height: 10,),
                CustomTextField(hint: 'Email',controller: controller.emailController,),
                const SizedBox(height: 10,),
                CustomTextField(hint: 'Mot de passe' , 
                obscureText: true,
                controller: controller.passwordController,
                ),
                const SizedBox(height: 10,),
                CustomTextField(hint: 'Confimer mot de passe' , 
                obscureText: true,
                controller: controller.confirmPasswordController,
                ),
                const SizedBox(height: 20,),
               CustomButton(label: "S'incrire", 
               onPressed: (){
                controller.checkRegister();
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
                      TextSpan(
                        text: 'deja un compte? ',
                      ),
                      TextSpan(
                        text: "Se connecter",
                        recognizer: TapGestureRecognizer()..onTap= (){
                          Get.toNamed(GetRoutes.login);
                        },
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),softWrap: false,
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
