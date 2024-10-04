import 'package:cinema_craze/utils/colors_manager.dart';
import 'package:cinema_craze/utils/app_strings.dart';
import 'package:flutter/material.dart';

class CustomShowDialog extends StatelessWidget {
  const CustomShowDialog(
      {super.key,
      required this.dialogContent,
      this.actionRequired,
      this.is2Actions = false});

  final String dialogContent;
  final VoidCallback? actionRequired;
  final bool is2Actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorsManager.bottomNavColor,
      content: Text(
        dialogContent,
        style: const TextStyle(color: Colors.white),
      ),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          onPressed: () {
            actionRequired?.call();
            Navigator.pop(context);
          },
          child: const Text(
            AppStrings.ok,
            style: TextStyle(color: Colors.white),
          ),
        ),
        if (is2Actions)
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(ColorsManager.borderColor),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              AppStrings.cancel,
              style: TextStyle(color: Colors.white),
            ),
          ),
      ],
    );
  }
}
