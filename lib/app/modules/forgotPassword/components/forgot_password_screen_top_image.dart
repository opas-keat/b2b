import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordScreenTopImage extends StatelessWidget {
  const ForgotPasswordScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 4,
              child:
                  SvgPicture.asset("icons/undraw_forgot_password_re_hxwm.svg"),
            ),
            const Spacer(),
          ],
        ),
        // const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
