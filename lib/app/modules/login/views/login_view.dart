import 'package:flutter/material.dart';

import '../../../../shared/background.dart';
import '../../../../shared/responsive.dart';
import 'login_form.dart';
import 'login_screen_top_image.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
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
            mobile: const MobileLoginScreen(),
            desktop: Row(
              children: [
                const Expanded(
                  child: LoginScreenTopImage(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: LoginForm(),
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

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopImage(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
