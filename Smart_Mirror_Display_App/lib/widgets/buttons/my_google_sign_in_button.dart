// Credit where credit is due. I pulled most of this file from the tutorial
// found here:
// https://levelup.gitconnected.com/using-firebase-in-flutter-web-4b99952180aa

import 'package:Smart_Mirror_Display_App/firebase_authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart' as buttons;
import 'package:provider/provider.dart';

// ===============================================================================================================================
// ======================================= MyGoogleSignInButton Class ============================================================
// ===============================================================================================================================

class MyGoogleSignInButton extends StatelessWidget {
  // ======================================= Class Functions =====================================================================

  /// This class houses the Google Sign In button for the user
  const MyGoogleSignInButton({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return buttons.GoogleSignInButton(
      onPressed: () {
        context.read<FirebaseAuthService>().signInWithGoogle();
      },
      darkMode: true,
      textStyle: TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),
    );
  }
}
