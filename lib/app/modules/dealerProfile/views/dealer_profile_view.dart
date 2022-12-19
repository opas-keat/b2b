import 'package:b2b/constants.dart';
import 'package:flutter/material.dart';

class DealerProfileView extends StatelessWidget {
  DealerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ตั้งค่า'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Center(
            child: CircleAvatar(
              radius: 75,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "assets/images/undraw_apartment_rent_o0ut.png"),
                radius: 70,
              ),
            ),
          ),
          const Text(
            "ร้าน ฟิวเจอร์ แม็กซ์ ไทร์ เซ็นเตอร์",
            style: TextStyle(
              fontSize: 36,
              // color: darkBlueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "9 ซ.สุทธิสารวินิจฉัย 1 ถ.สุทธิสารวินิจฉัย แขวงสามเสนใน เขตพญาไท กรุงเทพมหานคร 10400",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "โทรศัพท์ : 061-821-3441   โทรสาร : ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            "รับการแจ้งเตือนผ่านทาง Line กรุณาเพิ่มเพื่อนด้วย QR CODE ด้านล่าง",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.network(
            'assets/images/qr-code.png',
            height: 300,
          ),
        ],
      ),
    );
  }
}
