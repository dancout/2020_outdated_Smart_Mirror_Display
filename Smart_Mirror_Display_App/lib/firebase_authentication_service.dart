// Credit where credit is due. I pulled most of this file from the tutorial
// found here:
// https://levelup.gitconnected.com/using-firebase-in-flutter-web-4b99952180aa

import 'package:Smart_Mirror_Display_App/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ===============================================================================================================================
// ======================================= FirebaseAuthService Class =============================================================
// ===============================================================================================================================

class FirebaseAuthService {
  // ======================================= Class Variables =====================================================================
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  // ======================================= Class Functions =====================================================================

  /// This class handles the authentication service for Firebase. It can take in
  /// an existing [FirebaseAuth] or [GoogleSignIn] object to be used for testing.
  /// If neither are passed in, then it will create a new instance of both to be
  /// used for this session.
  FirebaseAuthService({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn();

  /// This function creates a [User] from a given [FirebaseUser] object, if it exists.
  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoUrl,
    );
  }

  /// This function will return the new user if the auth state has changed,
  /// meaning a new user has signed in, or the old user has signed out.
  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  /// This function allows a [User] to sign in anonymously.
  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  /// This function signs in a [User] using their google authentication.
  Future<User> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final authResult = await _firebaseAuth.signInWithCredential(credential);
    return _userFromFirebase(authResult.user);
  }

  /// This function signs the [User] out.
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  /// This function returns the current signed in [User].
  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }
}
