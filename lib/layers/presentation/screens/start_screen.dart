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
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                context.tr('welcome'),
                style: GoogleFonts.roboto(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 51, 51, 51),
                ),
              ),
              const SizedBox(height: 32),
              OutlinedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 51, 51, 51)),
                  side: MaterialStateProperty.all(BorderSide(color: const Color.fromARGB(255, 51, 51, 51))),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                ),
                onPressed: () => context.go('/task'),
                child: Text(
                  context.tr('Forward'),
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}