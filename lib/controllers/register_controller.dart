import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/rootes.dart';
import 'package:todo/utils/baseUrl.dart';
import 'package:todo/utils/snackbar.dart';
import 'package:todo/widgets/loader.dart';
import 'package:http/http.dart' as http;


class RegisterController extends GetxController {
  late TextEditingController nameController,
      telController,
      emailController,
      passwordController,
      confirmPasswordController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    telController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    telController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }


  checkRegister(){
    if(nameController.text.isEmpty){
      customSnackbar("Error", "le nom est requis", "error");
      return;
    }
    else if(telController.text.isEmpty){
       customSnackbar("Error", "le tel est requis", "error");
      return;
    }
    else if(emailController.text.isEmpty || GetUtils.isEmail(emailController.text)==false){
       customSnackbar("Error", "Saisir un email valide", "error");
      return;
    }
    else if(passwordController.text.isEmpty){
       customSnackbar("Error", "mot de passe est requis", "error");
      return;
    }
    else if(passwordController.text != confirmPasswordController.text){
       customSnackbar("Error", "les password ne sont pas identiques", "error");
      return;
    }
    else{
      Get.showOverlay(asyncFunction: ()=> register(),loadingWidget:const Loader() );
    }
  }

  register()async{
    var response  = await http.post(Uri.parse('${baseUrl}register.php'),body: {
      "nom":nameController.text,
      "tel":telController.text,
      "email":emailController.text,
      "password":passwordController.text,
    });

    var res = await json.decode(response.body);

    if(res['success']){
      customSnackbar("Success", res['message'], "success");
      Get.offAllNamed(GetRoutes.login);
    }else{
     customSnackbar("Erreur", res['message'], "error");
    }
  }

}
