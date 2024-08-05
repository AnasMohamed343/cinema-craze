import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverViewDialog extends StatelessWidget {
  String data;
  OverViewDialog({required this.data});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xff282A28),
      title: Text(
        'Overview',
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      ),
      content: Text(
        data,
        style: TextStyle(
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
