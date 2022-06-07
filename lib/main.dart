  import 'dart:io';
  import 'package:flutter/services.dart';
  import 'package:flutter/material.dart';
  import 'package:splash_screen_view/SplashScreenView.dart';
  
  
  
  
  import 'package:myapp/src/pages/entrypoint/page.dart';
  import 'package:teta_cms/teta_cms.dart';

  ///NOTE:
  ///if you have an error while running <flutter run> 
  ///run <flutter pub upgrade> and than <flutter run --no-sound-null-safety>
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    await TetaCMS.initialize(
      token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRhcmZyYW1ld29ya0BnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwicHJvamVjdHMiOlsxMjgwODYsMTI4ODI0LDEzMDA0NV0sImltYWdlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EtL0FPaDE0R2hlZ1JtYnRmeVBtRkczMU43a0xVS0ZYTjBVSXRNdHp1a1lCTUd2MUE9czk2LWMiLCJuYW1lIjoidGFyIGZyYW1ld29yayIsImVtaXR0ZXIiOiJUZXRhLUF1dGgiLCJpYXQiOjE2NTQ2MjMwNTQsImV4cCI6NDgxMDM4MzA1NH0.HKRfGjprLBcoQ4c8qwdaMS1YecZFrbzu3WljxK9_hxE',
      prjId: 130045,
    );
    
    
    
    
    runApp(MyApp());
  }
  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Untitled',
        home: SplashScreenView(
          navigateRoute: PageEntryPoint(),
          duration: 2200,
          imageSize: 80,
          imageSrc: 'assets/teta-app.png',
          text: '',
          textType: TextType.NormalText,
          textStyle: TextStyle(
            fontSize: 30.0,
          ),
          backgroundColor: Colors.black,
        ),
      );
    }
  }
  