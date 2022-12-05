import 'package:b2b/app/modules/register/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import '../../../../shared/widgets/custom_flat_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Your user",
              // prefixIcon: Padding(
              //   padding: EdgeInsets.all(defaultPadding),
              //   child: Icon(Icons.person),
              // ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                // prefixIcon: Padding(
                //   padding: EdgeInsets.all(defaultPadding),
                //   child: Icon(Icons.lock),
                // ),
              ),
            ),
          ),
          // const SizedBox(height: defaultPadding),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 35),
            child: CustomFlatButton(
              label: "Login".toUpperCase(),
              onPressed: () {
                Get.off(const RegisterView());
              },
            ),
          ),
          const SizedBox(height: defaultPadding),
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
