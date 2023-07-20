import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget extends StatelessWidget {
  final String message;

  const ToastWidget({required this.message, Key? key}) : super(key: key);

  _showToast(BuildContext context) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black45,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _showToast(context);
  }
}
