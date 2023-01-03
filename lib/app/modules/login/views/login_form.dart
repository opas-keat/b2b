import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import '../../../../shared/widgets/custom_flat_button.dart';
import '../controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final controller = Get.put(LoginController());

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dealerCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Column(
        children: [
          TextFormField(
            // keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: primaryColor,
            // onSaved: (email) {},
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: "Your Email",
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: primaryColor,
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: primaryColor,
              controller: _dealerCodeController,
              decoration: const InputDecoration(
                hintText: "Your Code",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
          ),
          // const SizedBox(height: defaultPadding),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 35),
            child: CustomFlatButton(
              // color: darkBlueColor,
              label: "Login".toUpperCase(),
              onPressed: () {
                controller.login(
                  _emailController.text,
                  _passwordController.text,
                  _dealerCodeController.text,
                );
              },
            ),
          ),
          const SizedBox(height: defaultPadding),
          TextButton(
            onPressed: () {
              controller.forgotPassword();
            },
            child: Text(
              'ลืมรหัสผ่าน?',
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Text(
            'หรือ',
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: defaultPadding),
          TextButton(
            onPressed: () {
              controller.register();
            },
            child: Text(
              'ลงทะเบียน',
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
          // AlreadyHaveAnAccountCheck(
          //   press: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return SignUpScreen();
          //         },
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
