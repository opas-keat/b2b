import 'package:b2b/app/modules/forgotPassword/controllers/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import '../../../../shared/widgets/custom_flat_button.dart';

class ForgotPasswordForm extends StatelessWidget {
  ForgotPasswordForm({super.key});
  final controller = Get.put(ForgotPasswordController());
  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            // cursorColor: darkBlueColor,
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
              obscureText: false,
              cursorColor: primaryColor,
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
              // color: darkBlueColor,
              label: "Submit".toUpperCase(),
              onPressed: () {
                controller.sendNewPassword();
              },
            ),
          ),
        ],
      ),
    );
  }
}
