import 'package:flutter/material.dart';

/// Map Firebase error codes to user-friendly messages
String getAuthErrorMessage(String code) {
  switch (code) {
    case 'invalid-email':
      return "The email address is badly formatted.";
    case 'user-disabled':
      return "This account has been disabled.";
    case 'user-not-found':
      return "No account found with this email.";
    case 'wrong-password':
      return "Incorrect password.";
    case 'email-already-in-use':
      return "This email is already registered.";
    case 'weak-password':
      return "Your password is too weak. Try at least 6 characters.";
    case 'invalid-credential':
      return "Invalid email or password.";
    default:
      return "Something went wrong. Please try again.";
  }
}

/// Show a red error snackbar
void showErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}

/// Show a loading dialog (use before async tasks)
void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(child: CircularProgressIndicator()),
  );
}
