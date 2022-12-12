import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreenTopImage extends StatelessWidget {
  const RegisterScreenTopImage({
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
              flex: 6,
              child: SvgPicture.asset("icons/undraw_mobile_login_re_9ntv.svg"),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
