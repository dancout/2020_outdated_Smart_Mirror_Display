library 'package:Smart_Mirror_Display_App/globals.dart';
import 'package:firebase/firebase.dart' as fb;

fb.Database db = fb
    .initializeApp(
      apiKey: "AIzaSyCJofAvAmlZSEsnu2uk8kpQ1-IAXvb_ysc",
      appId: "1:285844038893:web:b6853c1687b742e0b918e4",
      authDomain: "smart-mirror-display-app.firebaseapp.com",
      databaseURL: "https://smart-mirror-display-app.firebaseio.com",
      measurementId: "G-SB7LSRKQSZ",
      messagingSenderId: "285844038893",
      projectId: "smart-mirror-display-app",
      storageBucket: "smart-mirror-display-app.appspot.com",
    )
    .database();
