import 'package:cinema_craze/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverViewDialog extends StatelessWidget {
  String data;
  OverViewDialog({required this.data});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorsManager.moviesContainerBgColor,
      title: const Text(
        'Overview',
        style: TextStyle(
          color: ColorsManager.whiteColor,
          fontSize: 17,
        ),
      ),
      content: Text(
        data,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Close',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 16.sp, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
