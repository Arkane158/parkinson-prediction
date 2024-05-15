import 'package:flutter/material.dart';

/// DialogeUtils - Utility Class for Showing Dialogs
///
/// This class provides utility methods to show various types of dialogs.
class DialogeUtils {
  /// Shows a progress dialog with a loading indicator and a message.
  ///
  /// Parameters:
  ///   - context: The build context.
  ///   - message: The message to display in the progress dialog.
  ///   - isDismissible: Whether the progress dialog is dismissible by tapping outside.
  static void showProgressDialog(BuildContext context, String message,
      {bool isDismissible = false}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                width: 12,
              ),
              Text( 
                message,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
      },
      barrierDismissible: isDismissible,
    );
  }

  /// Shows a message dialog.
  ///
  /// Parameters:
  ///   - context: The build context.
  ///   - message: The message to display in the dialog.
  ///   - posActionTitle: The title of the positive action button.
  ///   - isDismissible: Whether the dialog is dismissible by tapping outside.
  ///   - posAction: The callback function for the positive action button.
  ///   - negAction: The callback function for the negative action button.
  ///   - negActionTitle: The title of the negative action button.
  static showMessage(BuildContext context, String message,
      {String? posActionTitle,
      bool isDismissible = false,
      VoidCallback? posAction,
      VoidCallback? negAction,
      String? negActionTitle}) {
    List<Widget> actions = [];
    if (posActionTitle != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (posAction != null) {
              posAction();
            }
          },
          child: Text(posActionTitle,
              style: const TextStyle(color: Colors.black))));
    }
    if (negActionTitle != null) {
      actions.add(TextButton(
          onPressed: () {
            if (negAction != null) {
              negAction();
            }
          },
          child: Text(negActionTitle,
              style: const TextStyle(color: Colors.black))));
    }

    showDialog(
        barrierDismissible: isDismissible,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(message, style: const TextStyle(color: Colors.black)),
            actions: actions,
          );
        });
  }

  /// Hides the currently displayed dialog.
  ///
  /// Parameters:
  ///   - context: The build context.
  static hideDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
