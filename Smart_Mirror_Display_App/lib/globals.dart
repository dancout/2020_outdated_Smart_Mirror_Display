import 'package:Smart_Mirror_Display_App/firebase_app.dart';
import 'package:firebase/firebase.dart' as fb;

// ===============================================================================================================================
// ======================================= Globals Class =========================================================================
// ===============================================================================================================================

// ======================================= Class Variables =======================================================================

// Initialize the Firebase DB to be used throughout the app
fb.Database db = firebaseApp.database();

// NOTE: You will need to generate the [firebaseApp] object yourself in your own `firebase_app.dart` file.
// This file contains sensitive information about your Firebase connection, and has been added to the .gitIgnore.
