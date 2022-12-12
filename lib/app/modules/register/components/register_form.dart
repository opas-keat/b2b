import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../../shared/widgets/custom_flat_button.dart';
import '../controllers/register_controller.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});
  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            // onSaved: (email) {},
            controller: controller.email,
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
              cursorColor: kPrimaryColor,
              controller: controller.password,
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
              obscureText: false,
              cursorColor: kPrimaryColor,
              controller: controller.memberCode,
              decoration: const InputDecoration(
                hintText: "Your Member Code",
                prefixIcon: Icon(Icons.card_membership_outlined),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 35),
            child: CustomFlatButton(
              label: "Register".toUpperCase(),
              onPressed: () {
                controller.register();
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
