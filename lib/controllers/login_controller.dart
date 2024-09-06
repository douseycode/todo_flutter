import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/models/user.dart';
import 'package:todo/rootes.dart';
import 'package:todo/utils/baseUrl.dart';
import 'package:todo/utils/shared_prefs.dart';
import 'package:todo/utils/snackbar.dart';
import 'package:todo/widgets/loader.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController{
   late TextEditingController emailController,passwordController;

   @override
  void onInit() {
    super.onInit();
    chekUser();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  chekUser()async{
    var user = await SharedPrefs().getUser();
    if(user!=null){
      Get.offAllNamed(GetRoutes.home);
    }
  }

  @override
  void onClose() {
    super.onClose();
     emailController.dispose();
    passwordController.dispose();
  }


  checkLogin(){
    if(emailController.text.isEmpty || GetUtils.isEmail(emailController.text)==false){
       customSnackbar("Error", "Saisir un email valide", "error");
      return;
    }
    else if(passwordController.text.isEmpty){
       customSnackbar("Error", "mot de passe est requis", "error");
      return;
    }
    else{
      Get.showOverlay(asyncFunction: ()=> login(),loadingWidget:const Loader() );
    }
  }

  login()async{
    var response  = await http.post(Uri.parse('${baseUrl}login.php'),body: {
      "email":emailController.text,
      "password":passwordController.text,
    });

    var res = await json.decode(response.body);

    if(res['success']){
      customSnackbar("Success", res['message'], "success");
      User user = User.fromJson(res['user']);
      await SharedPrefs().storeUser(json.encode(user));
      Get.offAllNamed(GetRoutes.home);
    }else{
     customSnackbar("Erreur", res['message'], "error");
    }
  }
      
}