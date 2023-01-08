import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../shared/background.dart';
import '../../../../shared/responsive.dart';
import '../components/forgot_password_form.dart';
import '../components/forgot_password_screen_top_image.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Container(
          alignment: Alignment.centerLeft,
          width: 120,
          child: Image.network(
            'assets/images/pp_white.png',
          ),
        ),
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Responsive(
            mobile: const MobileForgotPasswordScreen(),
            desktop: Row(
              children: [
                const Expanded(
                  child: ForgotPasswordScreenTopImage(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: ForgotPasswordForm(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MobileForgotPasswordScreen extends StatelessWidget {
  const MobileForgotPasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ForgotPasswordScreenTopImage(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: ForgotPasswordForm(),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
