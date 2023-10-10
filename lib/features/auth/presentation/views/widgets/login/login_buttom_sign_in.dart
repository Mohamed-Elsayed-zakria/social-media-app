import '../../../../../../core/widgets/custom_buttom.dart';
import '../../../controllers/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButtomSignIn extends StatelessWidget {
  const LoginButtomSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => loginIsLodinge.value != true
          ? CustomButton(
              text: 'Login'.tr,
              onPressed: () {
                if (formKeyLogin.currentState!.validate()) {
                  loginWithAccuont(
                    emailAddress: loginGetEmail.text,
                    password: loginGetPassword.text,
                  );
                }
              },
            )
          : Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const CircularProgressIndicator(),
            ),
    );
  }
}
