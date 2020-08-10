import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:Smart_Mirror_Display_App/firebase_authentication_service.dart';

// ===============================================================================================================================
// ======================================= SignInViewModel Class ============================================================
// ===============================================================================================================================

class SignInViewModel extends ChangeNotifier {
  /// This class helps with the loading states of the Sign In Page.
  SignInViewModel(this.locator);

  // ======================================= Class Variables =====================================================================

  final Locator locator;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // ======================================= Class Functions =====================================================================

  Future<void> signInAnonymously() async {
    _setLoading();
    await locator<FirebaseAuthService>().signInAnonymously();
    _setNotLoading();
  }

  void _setLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void _setNotLoading() {
    _isLoading = false;
    notifyListeners();
  }
}
