import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 80, right: 80, bottom: 40, top: 160
            ),
            child: Image.asset('assets/images/avacado.jpeg'),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'We deliver groceries to your doorstep',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 20),
          
          Text(
            'Fresh Items Everyday',
            style: TextStyle(color: Colors.grey[600]),
          ),

          const Spacer(),

          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return const HomePage();
            })),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Shop Now',
                style: TextStyle(
                  color: Colors.white
                ),
              )
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}