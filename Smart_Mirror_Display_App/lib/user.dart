// Credit where credit is due. I pulled most of this file from the tutorial
// found here:
// https://levelup.gitconnected.com/using-firebase-in-flutter-web-4b99952180aa

import 'package:meta/meta.dart';

// ===============================================================================================================================
// ======================================= User Class ============================================================================
// ===============================================================================================================================

// ======================================= Class Variables =======================================================================

/// This class pulls uid, email, photoUrl, and displayName from the [FirebaseUser] type.
@immutable
class User {
  const User({
    @required this.uid,
    this.email,
    this.photoUrl,
    this.displayName,
  });

  final String uid;
  final String email;
  final String photoUrl;
  final String displayName;
}
