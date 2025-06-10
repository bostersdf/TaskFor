import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskfor/layers/presentation/screens/settings-screensTWO/settings_screen.dart';

class TWOLanguageClass extends StatefulWidget {
  const TWOLanguageClass({super.key});

  @override
  State<TWOLanguageClass> createState() => TWOLanguageClassState();
}

class TWOLanguageClassState extends State<TWOLanguageClass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(247, 247, 249, 1),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () => Navigator.push(
                    context,MaterialPageRoute(builder: (context) => TWOSettingsClass()),
                      ),
                  icon: Icon(CupertinoIcons.back),
                ),
              ),
              Text(
                context.tr('language'),
                style: GoogleFonts.roboto(
                  fontSize: 25,
                  color: Color.fromRGBO(43, 43, 43, 1),
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none
                ),
              ),
              SizedBox(width: 50),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: SizedBox(
                width: double.infinity,
                child: GestureDetector(
                 onTap: () {context.setLocale(Locale('ru'));
                 },
                  child: Container(
                    height: 60,
                    width: 400,
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Icon(Icons.language),
                        SizedBox(width: 20),
                        Text(
                        'Русский',
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: Color.fromRGBO(43, 43, 43, 1),
                            decoration: TextDecoration.none
                          ),
                        ),
                        SizedBox(width: 125,),
                        Image.asset(
                        'assets/RUS.png',
                        width: 40,
                        height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
            ),
          ),
                 SizedBox(height: 15),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {context.setLocale(Locale('en'));
                  },
                  child: Container(
                    height: 60,
                    width: 400,
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Icon(Icons.language),
                        SizedBox(width: 20),
                        Text(
                        'English',
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: Color.fromRGBO(43, 43, 43, 1),
                            decoration: TextDecoration.none
                          ),
                        ),
                        SizedBox(width: 135,),
                        Image.asset(
                        'assets/ENG.png',
                        width: 40,
                        height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
                ),
                ),
        ],
      ),
    );
  }
}
