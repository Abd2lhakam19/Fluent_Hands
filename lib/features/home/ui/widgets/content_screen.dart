import 'package:flutter/material.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.asset(
              'assets/images/letter_one1.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("أ", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text("ارفع يدك اليمنى، بحيث تكون راحة يدك مفتوحة وموجهة نحو الخارج. حرك يدك اليمنى من الأسفل إلى الأعلى وهي مقبوضة, وكأنك تشير إلى شروق الشمس. ثم ارفع الابهام والسبابة والوسطى وقم بثني الاخرين ثم ضعهم على فمك وكأنك تأخذ شيئا من فمك ثم انزل بيدك الى الأسفل وهي في نفس الوضع."
            ),
          ),
        ],
      ),
    );
  }
}
