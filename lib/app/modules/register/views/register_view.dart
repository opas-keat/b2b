import 'package:b2b/app/modules/register/components/register_form.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../background.dart';
import '../../../../responsive.dart';
import '../components/register_screen_top_image.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileRegisterScreen(),
          desktop: Row(
            children: [
              const Expanded(
                child: RegisterScreenTopImage(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: RegisterForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileRegisterScreen extends StatelessWidget {
  const MobileRegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const RegisterScreenTopImage(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: RegisterForm(),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
