import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ZEROStartClass extends StatefulWidget {
  const ZEROStartClass({super.key});

@override
 State<ZEROStartClass> createState() => ZEROStartClassState();
}

class ZEROStartClassState extends State<ZEROStartClass> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.tr('welcome'),
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/task'),
              child: Text(
              context.tr('Forward'),
              style: GoogleFonts.roboto(
              fontSize: 18,
              color: Color.fromRGBO(58, 43, 43, 1),
              fontWeight: FontWeight.w400,),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 195, 214, 248),
    );
  }
}