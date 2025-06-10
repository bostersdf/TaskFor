import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:taskfor/layers/presentation/screens/task_screen.dart';

class TWOVersionClass extends StatefulWidget {
  @override
  TWOVersionClassState createState() => TWOVersionClassState();
}

class TWOVersionClassState extends State<TWOVersionClass> {
  String version = '';

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      version = info.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr('infovers'),
          style: GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Text(('Version: $version'),
          style: GoogleFonts.roboto(fontSize: 25,)
        ),
      ),
    );
  }
}

class VersionUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 30),
        child: Row(
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
                  context,
                  MaterialPageRoute(builder: (context) => ONETaskApp()),
                ),
                icon: Icon(CupertinoIcons.back),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
