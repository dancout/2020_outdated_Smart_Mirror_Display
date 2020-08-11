// Credit where credit is due. I pulled most of this file from the tutorial
// found here:
// https://levelup.gitconnected.com/using-firebase-in-flutter-web-4b99952180aa

import 'package:Smart_Mirror_Display_App/widgets/buttons/my_google_sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sign_in_view_model.dart';

// ===============================================================================================================================
// ======================================= SignInView Class ======================================================================
// ===============================================================================================================================

class SignInView extends StatelessWidget {
  /// This class represents the sign in / Login page for a user to sign in.
  const SignInView({Key key}) : super(key: key);

  // ======================================= Class Functions =====================================================================

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInViewModel>(
      create: (_) => SignInViewModel(context.read),
      builder: (_, child) {
        return const Scaffold(
          body: SignInViewBody._(),
        );
      },
    );
  }
}

class SignInViewBody extends StatelessWidget {
  /// This class represents the sign in / Login page for a user to sign in.
  const SignInViewBody._({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select((SignInViewModel viewModel) => viewModel.isLoading);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Please sign in",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Expanded(
            child: isLoading ? _loadingIndicator() : _signInButtons(context),
          ),
        ],
      ),
    );
  }

  /// This is a loading indicator.
  Center _loadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  /// This returns the sign in buttons for the sign on page, currently only a
  /// [MyGoogleSignInButton] instance.
  Column _signInButtons(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        // const AnonymousSignInButton(),
        const MyGoogleSignInButton(),
        const Spacer(),
      ],
    );
  }
}
